# frozen_string_literal: true

module BlogDecorator
  def draft_label
    content_tag('span', 'draft', class: ['label', 'label-default']) if draft?
  end
end
