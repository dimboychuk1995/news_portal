module ApplicationHelper
  def show_time(time)
    time.strftime('%e %b %Y %H:%M:%S')
  end
end
