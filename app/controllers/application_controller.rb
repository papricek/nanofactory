class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_host_without_www
    @current_host_without_www ||= request.host.gsub(/www\./, '')
  end

  helper_method :current_site
  def current_site
    @current_site ||= configatron.sites.detect { |s| s.host == current_host_without_www }
  end

end
