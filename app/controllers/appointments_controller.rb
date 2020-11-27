class AppointmentsController < ApplicationController
    before_action :appt, only: [:show, :edit, :update, :destroy]

    def index
        # for when I incorporate admin
        @appts = Appointment.all
    end

    def new
        if current_user.is_student?
            @appt = current_user.appointments.build
        else
            flash[:error] = "Only students can create appointments"
            redirect_to current_user.url
        end
    end

    def create  
        @appt = Appointment.new_with_params(new_appt_params)
        if @appt.save
            redirect_to current_user.url
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @appt.update(appt_params)
            redirect_to current_user.url
        else
            render :edit
        end
    end

    def destroy
        @appt.destroy
        redirect_to current_user.url
    end

    private

    def appt
        @appt = Appointment.find_by_id(params[:id])
    end

    def appt_params
        params.require(:appointment).permit(:date_time, :tutor_id, :student_id)
    end

end
