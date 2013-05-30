class Mercury::ImagesController < MercuryController

  respond_to :json

  # POST /images.json
  def create
    @image = Mercury::Image.new(image_params)
    @image.save
    respond_with @image
  end

  # DELETE /images/1.json
  def destroy
    @image = Mercury::Image.find(params[:id])
    @image.destroy
    respond_with @image
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
