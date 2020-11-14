class Appointment < ApplicationRecord
  belongs_to :tutor
  belongs_to :student

  def self.new_with_params(hash)
      date = DateTime.new(
          hash["date_time(1i)"].to_i,
          hash["date_time(2i)"].to_i,
          hash["date_time(3i)"].to_i,
          hash["date_time(4i)"].to_i,
          hash["date_time(5i)"].to_i
      )
      Appointment.new({date_time: date, tutor_id: hash[:tutor_id], student_id: hash[:student_id]})
  end

  def time
    self.date_time.strftime("%A, %d %b %Y - %l:%M %p")
  end

end

