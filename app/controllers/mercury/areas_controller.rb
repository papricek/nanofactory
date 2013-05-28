class Mercury::AreasController < MercuryController

  respond_to :json

  # POST /areas.json
  def create
    puts params.inspect
    params[:content].each do |key, value|
      @area = Mercury::Area.where(key: key).first_or_initialize
      @area.content = value[:value]
      @area.save
    end
    render text: ""
  end

end
