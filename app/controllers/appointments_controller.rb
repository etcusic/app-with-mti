class AppointmentsController < ApplicationController
    # before_action :appt, only: [:show, :edit, :update, :destroy]

    def index
        @appts = Appointment.all
    end

    def new

    end

    def create

    end

    def show

    end

    def update

    end

    def destroy

    end

    private

    # def appt
    #     @appt = Appointment.find_by_id(???)
    # end

end
