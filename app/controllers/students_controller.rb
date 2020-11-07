class StudentsController < ApplicationController
    before_action :student, only: [:show, :edit, :update, :destroy]
    # skip_before_action :require_login, only: [:new, :create]

    def index
        @students = Student.gold_stars
    end
    
end