class User < ApplicationRecord
    validates :first_name, :last_name, :email, :type, presence: true
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "only allows letters with @" }
    validates_confirmation_of :password 
    has_secure_password

    def self.new_user_omni
        # need to account for failed user creation
        # need to account for different types of users
        name = auth['info']['name'].split(" ")
        password = SecureRandom.hex(10)
        @user = User.create(
            uid: auth['uid'],
            email: auth['info']['email'],
            first_name: name[0],
            last_name: name[1],
            image: auth['info']['image'],
            password: password,
            password_confirmation: password,
            type: "Student"
        )
    end

    def self.types
        ["Student", "Tutor"]
    end

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def is_tutor?
        self.class == Tutor
    end

    def is_student?
        self.class == Student
    end

    def appointments_by_date
        self.appointments.sort_by{|appt| appt.date_time}
    end
    
end