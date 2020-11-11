class User < ApplicationRecord
    validates :first_name, :last_name, :email, :category, presence: true
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "only allows letters with @" }
    validates_confirmation_of :password 
    has_secure_password

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

    def no
        "You're not Ron."    
    end

    def kill
        "I might actually kill you."
    end
    
end