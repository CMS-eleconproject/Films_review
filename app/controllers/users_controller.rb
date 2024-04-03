class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Temporary for initial login (replace with Devise methods)
      redirect_to films_path, notice: "User created successfully!"
    else
      render :new
    end
  end

  def show
    @films = @user.films.order(created_at: :desc) # Display user's films in descending order
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "User deleted successfully!"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end