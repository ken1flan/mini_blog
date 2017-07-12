module BlogDecorator
  def status_badge
    if draft?
      tag.span(status, class: 'badge badge-warning')
    end
  end
end
