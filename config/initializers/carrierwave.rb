# Setup Carrierwave to use local storage and disable file processing in test env
if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
  
  # make sure uploader is auto-loaded
  MealImageUploader
  
  # Separate test uploads from any other uploads
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end
  
      def store_dir
        "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end

CarrierWave.configure do |config|  
  config.asset_host = ActionController::Base.asset_host
end