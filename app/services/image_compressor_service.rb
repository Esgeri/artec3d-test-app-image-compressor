require 'mini_magick'

class ImageCompressorService < ApplicationService
  attr_reader :image

  def initialize(id)
    @image = Image.find_by(id: id)
  end

  def call
    loaded_image = MiniMagick::Image.new(@image.image_file.current_path)

    previous_signature = loaded_image.signature
    loaded_image.resize('25%')
    current_signature = loaded_image.signature

    if previous_signature != current_signature
      puts 'Image is successfully compressed!'
    else
      puts 'Image is not compressed!'
    end
  end
end
