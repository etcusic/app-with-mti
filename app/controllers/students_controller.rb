class StudentsController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def index
        @students = Student.gold_stars
    end

    def new
        @student = User.new
    end

    def create
        @student = User.new(student_params)
        if @student.save   
            session[:user_id] = @student.id
            redirect_to edit_student_path(@student)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        # validate user ?
        if @student.update(student_params)
            redirect_to "/students/#{@user.id}" 
        else 
            render :edit
        end
    end

    def destroy
        # warning/alert message
        current_user.destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def student
        @student = User.find_by_id(session[:user_id])
    end

    def student_params
        params.require('student').permit(
            :id, :image, :email, :first_name, :last_name, :password, :password_confirmation, 
            :about_me, :level, :helicopter_parent, :gold_stars
        )
    end
    
end