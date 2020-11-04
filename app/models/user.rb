class User < ApplicationRecord
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "only allows letters with @" }
    has_secure_password

    def is_tutor?
        self.class == Tutor
    end

    def is_student?
        self.class == Student
    end
    
end