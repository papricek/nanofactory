module ApplicationHelper
  include NavigationHelper

  def render_area(key)
    Mercury::Area.find_by_key(key).try(:content)
  end
end
