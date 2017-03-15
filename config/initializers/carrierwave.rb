require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'                          # required
    config.fog_credentials = {
      provider: 'AWS',                                     # required
      aws_access_key_id: ENV['aws_access_key_id'],         # required
      aws_secret_access_key: ENV['aws_secret_access_key']  # required
    }

    config.fog_directory  = ENV['fog_directory']              # required
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end