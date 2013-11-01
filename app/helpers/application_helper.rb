module ApplicationHelper
  include NavigationHelper

  def render_area(key)
    key_with_prefix = current_site.key_prefix + key
    Mercury::Area.find_by_key([key, key_with_prefix]).try(:content).to_s
  end

end
