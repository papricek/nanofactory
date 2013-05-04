class Site

  attr_accessor :host, :title, :folder

  def initialize(host: '', title: '', folder: nil)
    @host = host
    @title = title
    @folder = folder || host
  end

end
