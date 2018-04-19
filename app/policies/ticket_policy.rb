class TicketPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @ticket = model
  end
  def show?
    user_can_ticket
  end
  def create?
    user_can_create_ticket
  end
  def new?
    user_can_create_ticket
  end
  def edit?
    user_can_ticket
  end
  def update?
    user_can_ticket
  end
  def destroy?
    user_can_ticket
  end
  def user_can_ticket
    @project = Project.find(@ticket.project_id)
    @team = Team.find(@project.team_id)
    @team.users.exists?(@current_user.id)
  end
  def user_can_create_ticket
    @ticket.exists?
  end
end
