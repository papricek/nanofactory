class NewsletterRecipient < ActiveRecord::Base

  validates :email, presence: true, format: { with: /@/}

end