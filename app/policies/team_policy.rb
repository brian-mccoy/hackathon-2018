class TeamPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @team = model
  end
  def edit?
    user_can_team
  end
  def show?
    user_can_team
  end
  def update?
    user_can_team
  end
  def destroy?
    user_can_team
  end
  def user_can_team
    @team.users.exists?(@current_user.id)
  end
end
