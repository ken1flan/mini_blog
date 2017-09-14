# frozen_string_literal: true

module ApplicationHelper
  def alert_type(key)
    case key
    when 'notice'
      :success
    when 'alert'
      :warning
    else
      :info
    end
  end
end
