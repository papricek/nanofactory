class Site

  attr_accessor :host, :title, :folder, :email, :newsletter_recipient_created_subject

  def initialize(host: '', title: '', folder: nil)
    @host = host
    @title = title
    @folder = folder || host
  end
  
  def self.find_by_host(host)
    host = host.gsub(/www\./, '')
    new(configatron.sites.detect { |s| s[:host] == host })
  end

end
