class Student < User
    has_many :appointments, dependent: :destroy
    has_many :tutors, through: :appointments
    scope :no_helicopters, -> { where(helicopter_parent: false) }
    scope :higher_level, -> { where(:level > 49) }

    def self.gold_stars
        Student.all.sort_by{|stu| stu.gold_stars } .reverse
    end

end
