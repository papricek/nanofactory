class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :make_action_mailer_use_request_host

  include Mercury::Authentication

  layout :layout_with_mercury

  def layout_with_mercury
    !params[:mercury_frame] && is_editing? ? 'mercury' : current_site.folder
  end

  helper_method :is_editing?
  def is_editing?
    cookies[:editing] == 'true' && can_edit?
  end

  private
  helper_method :current_site

  def current_site
    @current_site ||= Site.find_by_host(request.host)
  end

  helper_method :administrators_computer?

  def administrators_computer?
    true
  end

  def not_authenticated(message = I18n.t('sessions.not_authenticated'))
    redirect_to root_path, alert: message
  end

  def make_action_mailer_use_request_host
    ActionMailer::Base.default_url_options[:host] = request.host
  end

end
