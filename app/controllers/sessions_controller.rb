class SessionsController < ApplicationController
  def create
    @user = User.find_from(auth_hash)
    @user ||= User.create_with_identity(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Signed in'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'signed out'
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
