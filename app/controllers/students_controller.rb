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
            redirect_to new_student_path
        end
    end

    def show

    end

    def edit
        # validate user request
        current_user
    end

    def update
        #validate user first
        #validate update info => current_user.errors
        current_user.update_student(student_params)
    end

    private

    def student
        @student = Student.find_by_id(session[:user_id])
    end

    def student_params
        params.require(:student).permit(:id, :first_name, :last_name, :email, :password, :about_me, :level, :gold_stars, :helicopter_parent, :image)
    end

    
end