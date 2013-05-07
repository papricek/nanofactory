class BaseMailer < ActionMailer::Base

  default :from => "info@eballance.cz"

  private
  def current_site
    Site.find_by_host(ActionMailer::Base.default_url_options[:host])
  end

end
