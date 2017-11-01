module ApplicationHelper
  def is_active?(controller_name, page_name)
    "active" if params[:action] == page_name && params[:controller] == controller_name
  end
end
