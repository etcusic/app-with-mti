class Student < User
    has_many :appointments
    has_many :tutors, through: :appointments
    validates :about_me, :level, presence: true

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
