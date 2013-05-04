class PagesController < ApplicationController

  layout lambda { current_site.folder }

  def index
  end

end
