class DashboardController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to user_session_path and return
    end

    @tickets = Ticket.where(:user_id => current_user.id)
  end
end
