class NewsletterRecipientsController < ApplicationController
  
  def create
    @newsletter_recipient = NewsletterRecipient.new(newsletter_recipient_params)
    @newsletter_recipient.site = current_site.host 
    if @newsletter_recipient.save
      flash[:notice] = "Email právě odletěl ;)"
      NewsletterMailer.newsletter_recipient_created(@newsletter_recipient, current_site).deliver
    else
      flash[:alert] = "Zadaný email není ve správném formátu."
    end
    redirect_to root_path
  end
  
  private
  def newsletter_recipient_params
    params.require(:newsletter_recipient).permit(:email)
  end
end