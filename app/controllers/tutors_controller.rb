class TutorsController < ApplicationController
    before_action :tutor, only: [:show, :edit, :update, :destroy]
    # skip_before_action :require_login, only: [:new, :create, :highest_rated]

    def index
        @tutors = Tutor.ranked_tutors
    end

    def highest_rated
        # is there a better way to scope this route?
        @tutor = Tutor.order(rating: :desc).first
        render :show
    end

end