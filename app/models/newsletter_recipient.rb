class NewsletterRecipient < ActiveRecord::Base

  validates :email, presence: true

end