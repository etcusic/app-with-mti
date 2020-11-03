class Student < User
    has_many :appointments
    has_many :tutors, through: :appointments
    validates :about_me, :level, presence: true
end
