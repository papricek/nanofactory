class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :make_action_mailer_use_request_host

  private
  helper_method :current_site
  def current_site
    @current_site ||= Site.find_by_host(request.host)
  end

  def not_authenticated(message = I18n.t('sessions.not_authenticated'))
    redirect_to root_path, alert: message
  end

  def make_action_mailer_use_request_host
    ActionMailer::Base.default_url_options[:host] = request.host
  end

end
