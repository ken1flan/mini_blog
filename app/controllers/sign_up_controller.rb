# frozen_string_literal: true

class SignUpController < ApplicationController
  def index
    invitation = Invitation.within_time_limit.find_by(token: params[:token])
    not_found unless invitation
    session[:invitation_id] = invitation.id
  end
end
