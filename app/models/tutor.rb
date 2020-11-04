class Tutor < User
    has_many :appointments
    has_many :students, through: :appointments
    validates :resume, :zoom_link, presence: true

    def update_tutor(hash)
        #refactor this for only tutor specific info
        self.update(
            first_name: hash[:first_name],
            last_name: hash[:last_name],
            email: hash[:email],
            password: hash[:password],
            resume: hash[:resume],
            zoom_link: hash[:zoom_link],
            puppets: hash[:puppets],
            image: hash[:image]
        )
    end
end
