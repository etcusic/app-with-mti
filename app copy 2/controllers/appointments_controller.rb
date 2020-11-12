class AppointmentsController < ApplicationController
    before_action :appt, only: [:show, :edit, :update, :destroy]

    def index
        @appts = Appointment.all
    end

    def new
        # Only students can view this page!
        @appt = current_user.appointments.build  #Appointment.new
    end

    def create  
        # binding.pry
        @appt = Appointment.new_with_params(new_appt_params)
        if @appt.save
            # binding.pry
            redirect_to user_path(current_user)
        else
            # error => means they did not select a tutor
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def appt_params
        params.require(:appointment).permit(:date_time, :tutor_id, :student_id)
    end

    def new_appt_params
        params.permit(
            "student_id",
            "tutor_id",
            "date_time(1i)",
            "date_time(2i)",
            "date_time(3i)",
            "date_time(4i)",
            "date_time(5i)"
        )
    end

    def appt
        @appt = Appointment.find_by_id(params[:id])
    end

end
