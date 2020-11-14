class Tutor < User
    has_many :appointments, dependent: :destroy
    has_many :students, through: :appointments
    scope :highly_rated, -> { where('rating > ?', 49) }
    scope :ranked_tutors, ->(column = :rating) { order(column => :desc) }

end
