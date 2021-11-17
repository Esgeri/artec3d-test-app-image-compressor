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
    render json: @image.as_json(only: [:uuid, :email, :image_file])
  end

  private

  def image_params
    params.permit(:email, :image_file)
  end
end
