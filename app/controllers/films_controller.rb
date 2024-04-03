class FilmsController < ApplicationController
    before_action :set_film, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user! # Devise handles authentication
  
    def index
      @films = Film.all
    end
  
    def new
      @film = Film.new
    end
  
    def create
        @film = Film.new(film_params)
        @film.user = current_user # Set the user for the film
      
        if @film.save
          redirect_to @film, notice: "Film created successfully!"
        else
          render :new
        end
      end      
  
    def show
      @like = Like.new(film_id: @film.id, user_id: current_user.id) # Pre-populate like form
      @reviews = @film.reviews.order(created_at: :desc) # Display reviews in descending order
    end
  
    def edit
    end
  
    def update
      if @film.update(film_params)
        redirect_to @film, notice: "Film updated successfully!"
      else
        render :edit
      end
    end
  
    def destroy
      @film.destroy
      redirect_to films_path, notice: "Film deleted successfully!"
    end
  
    private
  
    def set_film
      @film = Film.find(params[:id])
    end
  
    def film_params
      params.require(:film).permit(:title, :release_date, :director, :description, :poster_url)
    end
  end
  