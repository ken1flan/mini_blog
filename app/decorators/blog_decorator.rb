# frozen_string_literal: true

module BlogDecorator
  def draft_label
    content_tag('span', 'draft', class: %i[badge badge-pill badge-secondary]) if draft?
  end
end
