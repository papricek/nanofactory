class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  def can_access?(current_site)
    admin? || current_site.host == self.site
  end
end
