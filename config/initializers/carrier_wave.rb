if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

elsif Rails.env.development?

  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['AWS_ACCESS_ID'],                        # required unless using use_iam_profile
      aws_secret_access_key: ENV['AWS_SECRET_ID']                        # required unless using use_iam_profile
      #use_iam_profile:       true,                         # optional, defaults to false
      #region:                'eu-east-1',                  # optional, defaults to 'us-east-1'
      #host:                  's3.example.com',             # optional, defaults to nil
      #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = 'desafiofinal'                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  end

elsif Rails.env.production?
  CarrierWave.configure do |config|
    #config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['AWS_ACCESS_ID'],                        # required unless using use_iam_profile
      aws_secret_access_key: ENV['AWS_SECRET_ID'],                        # required unless using use_iam_profile
      #use_iam_profile:       true,                         # optional, defaults to false
      #region:                'eu-east-1',                  # optional, defaults to 'us-east-1'
      #host:                  's3.example.com',             # optional, defaults to nil
      #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = 'desafiofinalprod'                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  end
end