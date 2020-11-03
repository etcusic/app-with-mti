class User < ApplicationRecord
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    # validate :valid_email?
    has_secure_password

    def valid_email?
        if :email !=~ /^(.+)@(.+)$/ # should it be :email or email ???
            errors.add(:email, "is wrong, you mo-fo")
        end
    end

end