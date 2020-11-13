class Student < User
    has_many :appointments, dependent: :destroy
    has_many :tutors, through: :appointments
    scope :no_helicopters, -> { where(helicopter_parent: false) }
    scope :higher_level, -> { where(:level > 49) }

    def self.gold_stars
        Student.all.sort_by{|stu| stu.gold_stars } .reverse
    end

    def update_student(hash)
        #refactor this for only student specific info
        self.update(
            first_name: hash[:first_name],
            last_name: hash[:last_name],
            email: hash[:email],
            password: hash[:password],
            about_me: hash[:about_me],
            level: hash[:level],
            helicopter_parent: hash[:helicopter_parent],
            image: hash[:image]
        )
    end

end
