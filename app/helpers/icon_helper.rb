# frozen_string_literal: true

module IconHelper
  def icon(name)
    content_tag(:span, nil, class: "oi oi-#{name}", title: name, 'aria-hidden': true)
  end
end
