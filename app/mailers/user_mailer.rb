class UserMailer < BaseMailer

  def reset_password(user)
    @user = user
    mail(:to => user.email,
         :subject => t('user_mailer.reset_password.subject', name: current_site.name))
  end
end