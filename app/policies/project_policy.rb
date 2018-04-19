class ProjectPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @project = model
    @team = Team.find(@project.team_id)
  end
  def show?
    user_can_project
  end
  def create?
    user_can_project
  end
  def new?
    user_can_project
  end
  def edit?
    user_can_project
  end
  def update?
    user_can_project
  end
  def destroy?
    user_can_project
  end
  def user_can_project
    @team.users.exists?(@current_user.id)
  end
end
