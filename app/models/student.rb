class Student < User
    has_many :appointments
    has_many :tutors, through: :appointments
    validates :about_me, :level, :helicopter_parent, presence: true
end
