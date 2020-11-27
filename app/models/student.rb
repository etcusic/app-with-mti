class Student < User
    has_many :appointments, dependent: :destroy
    has_many :tutors, through: :appointments
    scope :gold_stars, ->(column = :gold_stars) { order(column => :desc) }
    scope :levels, ->(column = :level) { order(column => :desc) }

    # should I incorporate this into users_table and assign upon creation?
    def url
        "/students/#{self.id}"
    end

end
