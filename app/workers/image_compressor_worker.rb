class ImageCompressorWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 3

  def perform(id)
    ImageCompressorService.call(id)
  end
end
