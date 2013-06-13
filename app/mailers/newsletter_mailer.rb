class NewsletterMailer < BaseMailer

  def newsletter_recipient_created(newsletter_recipient, current_site)
    mail(to: newsletter_recipient.email,
         from: current_site.email,
         subject: current_site.newsletter_recipient_created_subject,
         template_path: "newsletter_mailer/#{current_site.folder}")
  end
end
