class AppointmentsController < ApplicationController
    before_action :appt, only: [:show, :edit, :update, :destroy]

    def index
        @appts = Appointment.all
    end

    def new
        # Only students can view this page!
        @appt = Appointment.new
    end

    def create  
        @appt = Appointment.new_with_params(appt_params)
        if @appt.save
           redirect_to student_path(current_user)
        else
            # error => means they did not select a tutor
            redirect_to new_appointment_path
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

    def appt
        @appt = Appointment.find_by_id(params[:id])
    end

end
