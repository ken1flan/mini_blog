module UsersHelper
  def editable_user?(user)
    current_user == user
  end
end
