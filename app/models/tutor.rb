class Tutor < User
    has_many :appointments, dependent: :destroy
    has_many :students, through: :appointments
    scope :puppets, -> { where(puppets: true) }
    scope :highly_rated, -> { where(:rating > 49) }

    def self.ranked_tutors
        sorted = Tutor.all.sort_by{|t| t.rating} .reverse
    end

end
