class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to(:recipes, notice: 'Login erfolgreich')
    else
      flash.now[:alert] = 'Login fehlgeschlagen'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Du hast dich ausgeloggt')
  end
end