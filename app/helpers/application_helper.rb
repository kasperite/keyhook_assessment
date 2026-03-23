module ApplicationHelper
  def flash_class(level)
    case level.to_s
    when "notice" then "alert-info"
    when "success" then "alert-success"
    when "error", "alert" then "alert-danger"
    when "warning" then "alert-warning"
    else "alert-info"
    end
  end
end
