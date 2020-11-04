class UsersController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        # incorporate errors for invalid input
        @user = User.new(user_params)
        if @user.save
            user_path(@user)
        else
            # error page
            redirect_to new_user_path
        end
    end

    def show
        # binding.pry
        params.permit(:id)
        if params[:id].to_i == @user.id
            user_path(@user)
        else
            # add error message?
            redirect_to "/"
        end
    end

    def edit
        # validate user request
        if current_user.is_tutor?
            edit_tutor_path(current_user)
        elsif current_user.is_student?
            edit_student_path(current_user)
        else
            #should not be an else, but....
            redirect_to '/'
        end
    end

    def update
        #validate user 
        # nest hash - basic user info & tutor/student info??

        # if current_user.is_tutor?
        #     current_user.update_tutor(tutor_params)
        # elsif current_user.is_student?
        #     current_user.update_student(student_params)
        # end
    end

    def destroy
        current_user.destroy
        session.destroy
        redirect_to 'sessions#destroy'
    end

    private

    def user
        @user = User.find_by_id(session[:user_id])
    end

    def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :password)
    end

    # def tutor_params
    #     params.require(:user).permit(:first_name, :last_name, :password, :resume, :rating, :zoom_link, :puppets, :image)
    # end

    # def student_params
    #     params.require(:user).permit(:id, :first_name, :last_name, :password, :about_me, :level, :gold_stars, :helicopter_parent, :image)
    # end

end

# UsersController to do list:
#     - create a before_action #valid_request? to check for users accessing what they're allowed (show, edit, update, destroy) - does this go in ApplicationController?
#     - errors for invalid input in #create action
#     - errors for invalid #update
#     - warning for #destroy

# TutorsAndStudentsController
#     - #update => divide into basic user info hash and tutor/student hash
#     - refactor tutor_params and student_params according to what works
#     - revisit routes to trim down what is necessary