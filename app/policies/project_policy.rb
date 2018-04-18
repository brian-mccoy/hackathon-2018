class ProjectPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @project = model
  end
  def edit?
    user_who_can_change_project
  end
  def update?
    user_who_can_change_project
  end
  def destroy?
    user_who_can_change_project
  end
  def user_who_can_change_project
    @project.user_id == @current_user.id
  end
end
