class Tutor < User
    has_many :appointments, dependent: :destroy
    has_many :students, through: :appointments
    scope :highly_rated, -> { where('rating > ?', 49) }
    # use scopes for users to see items according to attributes

    def self.ranked_tutors
        sorted = Tutor.all.sort_by{|t| t.rating} .reverse
    end

end

# Tutor.highly_rated
