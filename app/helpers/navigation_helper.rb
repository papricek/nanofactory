require 'ostruct'

module NavigationHelper
  
  def site_asset_path(file)
    asset_path(current_site.folder + "/" + file)
  end

end
