class Tutor < User
    has_many :appointments
    has_many :students, through: :appointments
    validates :resume, :zoom_link, :puppets, presence: true
end
