class CompressedImageMailer < ApplicationMailer
  def image_compressed(image)
    @image = image
    mail(to: @image.email, subject: 'Image compression.')
  end

  def image_not_compressed(image)
    mail(to: @image.email, subject: 'Image compression.')
  end
end
