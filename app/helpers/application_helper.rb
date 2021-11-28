module ApplicationHelper
  def max_width
    if controller_name == "recruitments"
      "mw-md"
    elsif devise_controller?
      "mw-sm"
    else
      "mw-lg"
    end
  end

  def status_color(deck)
    if deck.status == "public"
      "color: limegreen;"
    else
      "color: red;"
    end
  end
end
