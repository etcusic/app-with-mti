class AppointmentsController < ApplicationController
    before_action :appt, only: [:edit, :update, :destroy]
    skip_before_action :validate_user
    # before_action :validate_user_appts

    def index
        # for when I incorporate admin
        @appts = Appointment.all
    end

    def new
        if current_user.is_student?
            @appt = current_user.appointments.build
        else
            redirect_to "/users/#{current_user.id}"
        end
    end

    def create  
        @appt = Appointment.new_with_params(new_appt_params)
        if @appt.save
            redirect_to "/users/#{current_user.id}"
        else
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
        binding.pry
        @appt.destroy
        redirect_to "/users/#{current_user}"
    end

    private

    def appt
        @appt = Appointment.find_by_id(params[:id])
    end

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

    def validate_user_appts
        if params[:user_id] != current_user.id.to_s
            redirect_to '/nacho_stuff'
        end
    end

end
