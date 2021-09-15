class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:recipes, notice: 'Login erfolgreich')
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