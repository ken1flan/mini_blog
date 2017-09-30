module BlogDecorator
  def draft_label
    content_tag 'span', class: ['label', 'label-default'] { 'draft' } if draft?
  end
end
