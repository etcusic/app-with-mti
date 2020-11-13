class Student < User
    has_many :appointments, dependent: :destroy
    has_many :tutors, through: :appointments

    def self.gold_stars
        Student.all.sort_by{|stu| stu.gold_stars } .reverse
    end

end
