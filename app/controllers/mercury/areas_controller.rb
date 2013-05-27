class Mercury::AreasController < MercuryController

  respond_to :json

  # POST /areas.json
  def create
    puts params.inspect
    @area = Mercury::Area.new(params[:area])
    @area.host = request.host
    @area.save
    respond_with @area
  end

end
