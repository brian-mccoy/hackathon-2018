class CommentPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @comment = model
  end
  def edit?
    user_who_can_change_comment
  end
  def update?
    user_who_can_change_comment
  end
  def destroy?
    user_who_can_change_comment
  end
  def user_who_can_change_comment
    @comment.user.id == @current_user.id
  end
end
