class UsersController < ApplicationController
  skip_before_action :require_login

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User erfolgreich angelegt"
      redirect_to users_path
    else
      flash[:alert] = "User konnte nicht angelegt werden"
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User erfolgreich geändert"
      redirect_to users_path
    else 
      flash[:alert] = "User konnte nicht geändert werden"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User erfolgreich gelöscht"
      redirect_to users_path
    else
      flash[:alert] = "User konnte nicht gelöscht werden"
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :role, :password, :password_confirmation)
  end

end
