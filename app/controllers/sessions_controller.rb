# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    if session[:invitation_id]
      create_with_user_and_identity
      return
    end

    unless (@user = User.find_from(auth_hash))
      redirect_to root_path, alert: 'You need to sign up.'
      return
    end

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

  def create_with_user_and_identity
    invitation = Invitation.within_time_limit.find(session[:invitation_id])
    @user ||= User.create_with_identity(auth_hash)
    not_found unless invitation

    session[:user_id] = @user.id
    session.delete :invitation_id
    invitation.destroy
    redirect_to user_path(@user), notice: 'Welcome to mini blog.'
  end
end
