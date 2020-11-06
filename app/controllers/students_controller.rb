class StudentsController < ApplicationController
    before_action :student, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def index
        @students = Student.gold_stars
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save   
            session[:user_id] = @student.id
            redirect_to "/users/#{@student.id}"
        else
            # error page
            render :new
        end
    end

    def show

    end

    def edit
        # validate user request
        current_user
    end

    def update
        # binding.pry
        #validate user first
        #validate update info => current_user.errors
        if @student.update(student_params)
            render :show
        else
            render :edit
        end
    end

    def destroy
        # warning/alert message
        binding.pry
        current_user.appointments.destroy_all
        current_user.destroy
        redirect_to 'sessions#destroy'
    end

    private

    def student
        @student = Student.find_by_id(session[:user_id])
    end

    def student_params
        params.require(:student).permit(:id, :first_name, :last_name, :email, :password, :about_me, :level, :gold_stars, :helicopter_parent, :image)
    end

    
end