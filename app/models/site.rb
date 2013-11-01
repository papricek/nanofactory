class Site

  attr_accessor :host, :title, :folder, :key_prefix, :email, :newsletter_recipient_created_subject

  def initialize(hash)
    @host = hash[:host]
    @title = hash[:title]
    @folder = hash[:folder] || host
    @email = hash[:email]
    @key_prefix = hash[:key_prefix]
    @newsletter_recipient_created_subject = hash[:newsletter_recipient_created_subject]
  end

  def key_prefix
    @key_prefix ||= @host.parameterize.underscore + '_'
  end

  def self.find_by_host(host)
    host = host.gsub(/www\./, '')
    new(configatron.sites.detect { |s| s[:host] == host })
  end

end
