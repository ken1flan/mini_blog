class SignUpController < ApplicationController
  def index
    invitation = Invitation.within_time_limit.find_by(token: params[:token])
    unless invitation
      not_found
    end
    session[:invitation_id] = invitation.id
  end
end
