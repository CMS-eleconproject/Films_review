class ReviewsController < ApplicationController
    before_action :set_film, only: [:create]
    before_action :authenticate_user! # Devise handles authentication
  
    def create
      @review = @film.reviews.build(review_params.merge(user_id: current_user.id))
      if @review.save
        redirect_to film_path(@film), notice: "Review created successfully!"
      else
        # Handle review creation error
        @reviews = @film.reviews.order(created_at: :desc) # Pre-populate reviews for the view
        render 'show', template: 'films/show' # Render film show view with errors
      end
    end
  
    private
  
    def set_film
      @film = Film.find(params[:film_id])
    end
  
    def review_params
      params.require(:review).permit(:content, :rating)
    end
  end
  