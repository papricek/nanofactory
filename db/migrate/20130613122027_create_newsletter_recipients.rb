class CreateNewsletterRecipients < ActiveRecord::Migration
  def change
    create_table :newsletter_recipients do |t|
      t.string :email
      t.string :site
      
      t.timestamps
    end
  end
end
