class TicketPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @ticket = model
  end
  def edit?
    user_who_can_change_ticket
  end
  def update?
    user_who_can_change_ticket
  end
  def destroy?
    user_who_can_change_ticket
  end
  def user_who_can_change_ticket
    @ticket.user_id == @current_user.id
  end
end
