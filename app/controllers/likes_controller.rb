class LikesController < ApplicationController
    before_action :authenticate_user! # Devise handles authentication
  
    def create
      @like = Like.new(like_params.merge(user_id: current_user.id))
      if @like.save
        redirect_to film_path(@like.film_id), notice: "Liked!"
      else
        # Handle like creation error (e.g., redirect with error message)
      end
    end
  
    def destroy
      @like = Like.find_by(user_id: current_user.id, film_id: params[:film_id])
      @like.destroy if @like
      redirect_to film_path(params[:film_id]), notice: "Unliked!"
    end
  
    private
  
    def like_params
      params.permit(:film_id)
    end
  end
  