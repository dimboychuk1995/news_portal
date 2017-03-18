module ApplicationHelper
  def show_time(time)
    time.strftime('%e %b %Y %H:%M:%S')
  end

  def active_class(link_path)
    request.url.include?(link_path) ? 'active' : ''
  end
end
