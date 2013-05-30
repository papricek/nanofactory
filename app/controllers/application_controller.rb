class ApplicationController < ActionController::Base
  include Mercury::Authentication

  protect_from_forgery with: :exception
  before_action :make_action_mailer_use_request_host
  before_action :turn_off_editor_unless_logged_in

  layout :layout_with_mercury

  private

  helper_method :current_site
  def current_site
    @current_site ||= Site.find_by_host(request.host)
  end

  helper_method :is_editing?
  def is_editing?
    cookies[:editing] == 'true' && can_edit?
  end

  helper_method :administrators_computer?
  def administrators_computer?
    cookies[:editing].present?
  end

  def not_authenticated(message = I18n.t('sessions.not_authenticated'))
    redirect_to root_path, alert: message
  end

  def make_action_mailer_use_request_host
    ActionMailer::Base.default_url_options[:host] = request.host
  end

  def turn_off_editor_unless_logged_in
    cookies[:editing] = 'false' unless logged_in?
  end

  def layout_with_mercury
    !params[:mercury_frame] && is_editing? ? 'mercury' : current_site.folder
  end

end
