module ApplicationHelper
	def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, 
      :space_after_headers => true)
    markdown.render(text).html_safe
  end
end
