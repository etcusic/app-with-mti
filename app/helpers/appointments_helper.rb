module AppointmentsHelper

    def appt_path
        "/users/#{current_user.id}/appointments/#{@appt.id}"
    end

end
