class TicketPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @ticket = model
  end
  def edit?
    user_who_can_change_post
  end
  def update?
    user_who_can_change_post
  end
  def user_who_can_change_post
    @ticket.user_id == @current_user.id
  end
end
