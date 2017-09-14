# frozen_string_literal: true

module UsersHelper
  def editable_user?(user)
    current_user == user
  end
end
