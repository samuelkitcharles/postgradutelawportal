// Supabase Configuration and Connection
// Replace with your actual Supabase project credentials

const SUPABASE_CONFIG = {
    url: 'https://rwybzknircmlddouqdmhz.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJyeWJ6a25pcmNtbGRvdXFkbWh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYzMjU2MTEsImV4cCI6MjA4MTkwMTYxMX0._nE8UEZyRnlygb1Dv25JeErutzAS8tLkUYCsJkyHrVU' 
};

// Initialize Supabase client
const supabase = window.supabase.createClient(
    SUPABASE_CONFIG.url,
    SUPABASE_CONFIG.anonKey
);

// Auth Helper Functions
const Auth = {
    // Sign up new user
    async signUp(email, password, userType, metadata = {}) {
        try {
            const { data, error } = await supabase.auth.signUp({
                email: email,
                password: password,
                options: {
                    data: {
                        user_type: userType, // 'student' or 'lecturer'
                        ...metadata
                    }
                }
            });
            
            if (error) throw error;
            return { success: true, data };
        } catch (error) {
            console.error('Sign up error:', error);
            return { success: false, error: error.message };
        }
    },

    // Sign in existing user
    async signIn(email, password) {
        try {
            const { data, error } = await supabase.auth.signInWithPassword({
                email: email,
                password: password
            });
            
            if (error) throw error;
            return { success: true, data };
        } catch (error) {
            console.error('Sign in error:', error);
            return { success: false, error: error.message };
        }
    },

    // Sign out
    async signOut() {
        try {
            const { error } = await supabase.auth.signOut();
            if (error) throw error;
            return { success: true };
        } catch (error) {
            console.error('Sign out error:', error);
            return { success: false, error: error.message };
        }
    },

    // Get current user
    async getCurrentUser() {
        try {
            const { data: { user }, error } = await supabase.auth.getUser();
            if (error) throw error;
            return user;
        } catch (error) {
            console.error('Get user error:', error);
            return null;
        }
    },

    // Get session
    async getSession() {
        try {
            const { data: { session }, error } = await supabase.auth.getSession();
            if (error) throw error;
            return session;
        } catch (error) {
            console.error('Get session error:', error);
            return null;
        }
    }
};

// Database Helper Functions
const DB = {
    // Students
    students: {
        async create(studentData) {
            const { data, error } = await supabase
                .from('students')
                .insert([studentData])
                .select();
            
            if (error) {
                console.error('Error creating student:', error);
                return { success: false, error };
            }
            return { success: true, data: data[0] };
        },

        async getById(studentId) {
            const { data, error } = await supabase
                .from('students')
                .select('*, programs(*), semesters(*)')
                .eq('student_id', studentId)
                .single();
            
            if (error) {
                console.error('Error fetching student:', error);
                return { success: false, error };
            }
            return { success: true, data };
        },

        async getByEmail(email) {
            const { data, error } = await supabase
                .from('students')
                .select('*, programs(*), semesters(*)')
                .eq('email', email)
                .single();
            
            if (error) {
                console.error('Error fetching student by email:', error);
                return { success: false, error };
            }
            return { success: true, data };
        },

        async update(studentId, updates) {
            const { data, error } = await supabase
                .from('students')
                .update(updates)
                .eq('student_id', studentId)
                .select();
            
            if (error) {
                console.error('Error updating student:', error);
                return { success: false, error };
            }
            return { success: true, data: data[0] };
        }
    },

    // Lecturers
    lecturers: {
        async create(lecturerData) {
            const { data, error } = await supabase
                .from('lecturers')
                .insert([lecturerData])
                .select();
            
            if (error) {
                console.error('Error creating lecturer:', error);
                return { success: false, error };
            }
            return { success: true, data: data[0] };
        },

        async getById(lecturerId) {
            const { data, error } = await supabase
                .from('lecturers')
                .select('*')
                .eq('lecturer_id', lecturerId)
                .single();
            
            if (error) {
                console.error('Error fetching lecturer:', error);
                return { success: false, error };
            }
            return { success: true, data };
        },

        async getByEmail(email) {
            const { data, error } = await supabase
                .from('lecturers')
                .select('*')
                .eq('email', email)
                .single();
            
            if (error) {
                console.error('Error fetching lecturer by email:', error);
                return { success: false, error };
            }
            return { success: true, data };
        }
    },

    // Enrollments
    enrollments: {
        async getStudentEnrollments(studentId, semesterId) {
            const { data, error } = await supabase
                .from('enrollments')
                .select(`
                    *,
                    courses(*, programs(*)),
                    semesters(*)
                `)
                .eq('student_id', studentId)
                .eq('semester_id', semesterId)
                .eq('status', 'Active');
            
            if (error) {
                console.error('Error fetching enrollments:', error);
                return { success: false, error };
            }
            return { success: true, data };
        },

        async create(enrollmentData) {
            const { data, error } = await supabase
                .from('enrollments')
                .insert([enrollmentData])
                .select();
            
            if (error) {
                console.error('Error creating enrollment:', error);
                return { success: false, error };
            }
            return { success: true, data: data[0] };
        }
    },

    // Exam Results
    examResults: {
        async getStudentResults(studentId) {
            const { data, error } = await supabase
                .from('exam_results')
                .select(`
                    *,
                    exam_schedule(*, courses(*))
                `)
                .eq('student_id', studentId);
            
            if (error) {
                console.error('Error fetching exam results:', error);
                return { success: false, error };
            }
            return { success: true, data };
        }
    },

    // Exams
    exams: {
        async getUpcomingExams(studentId, semesterId) {
            // First get student's enrolled courses
            const { data: enrollments, error: enrollError } = await supabase
                .from('enrollments')
                .select('course_id')
                .eq('student_id', studentId)
                .eq('semester_id', semesterId);
            
            if (enrollError) {
                console.error('Error fetching enrollments:', enrollError);
                return { success: false, error: enrollError };
            }

            const courseIds = enrollments.map(e => e.course_id);

            // Then get upcoming exams for those courses
            const { data, error } = await supabase
                .from('exam_schedule')
                .select('*, courses(*)')
                .in('course_id', courseIds)
                .gte('exam_date', new Date().toISOString().split('T')[0])
                .order('exam_date', { ascending: true });
            
            if (error) {
                console.error('Error fetching upcoming exams:', error);
                return { success: false, error };
            }
            return { success: true, data };
        }
    },

    // Programs
    programs: {
        async getAll() {
            const { data, error } = await supabase
                .from('programs')
                .select('*')
                .order('program_name');
            
            if (error) {
                console.error('Error fetching programs:', error);
                return { success: false, error };
            }
            return { success: true, data };
        }
    },

    // Announcements
    announcements: {
        async getRecent(limit = 5) {
            const { data, error } = await supabase
                .from('announcements')
                .select('*')
                .order('posted_at', { ascending: false })
                .limit(limit);
            
            if (error) {
                console.error('Error fetching announcements:', error);
                return { success: false, error };
            }
            return { success: true, data };
        }
    },

    // Teaching Assignments
    teachingAssignments: {
        async getLecturerCourses(lecturerId, semesterId) {
            const { data, error } = await supabase
                .from('teaching_assignments')
                .select(`
                    *,
                    courses(*),
                    semesters(*)
                `)
                .eq('lecturer_id', lecturerId)
                .eq('semester_id', semesterId);
            
            if (error) {
                console.error('Error fetching teaching assignments:', error);
                return { success: false, error };
            }
            return { success: true, data };
        }
    }
};

// Utility Functions
const Utils = {
    // Generate student ID
    generateStudentId() {
        const year = new Date().getFullYear();
        const random = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
        return parseInt(`${year}${random}`);
    },

    // Generate lecturer ID
    generateLecturerId() {
        const random = Math.floor(Math.random() * 10000);
        return random;
    },

    // Calculate GPA
    calculateGPA(results) {
        if (!results || results.length === 0) return 0;
        
        const total = results.reduce((sum, result) => sum + (result.score || 0), 0);
        return (total / results.length / 25).toFixed(2); // Assuming 100 point scale to 4.0 GPA
    },

    // Format date
    formatDate(dateString) {
        const options = { year: 'numeric', month: 'short', day: 'numeric' };
        return new Date(dateString).toLocaleDateString('en-US', options);
    },

    // Format time
    formatTime(timeString) {
        return new Date('2000-01-01 ' + timeString).toLocaleTimeString('en-US', {
            hour: 'numeric',
            minute: '2-digit',
            hour12: true
        });
    }
};

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { supabase, Auth, DB, Utils };
}