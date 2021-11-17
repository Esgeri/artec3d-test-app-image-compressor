class ImagesController < ApplicationController
  def compress
    @image = Image.new(image_params.merge(uuid: SecureRandom.uuid))

    if @image.save
      ImageCompressorWorker.perform_async(@image.id)
      render json: { message: 'The image file is successfully uploaded!' }, status: :ok
    else
      render json: { message: @image.errors }, status: :unprocessable_entity
    end
  end

  def download
    @image = Image.find_by_uuid(params[:uuid])
    send_file "#{Rails.root}/public#{@image.image_file.url}", type: 'image/jpg', disposition: 'attachment'
  end

  private

  def image_params
    params.permit(:email, :image_file)
  end
end
