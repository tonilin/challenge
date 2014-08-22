# -*- encoding : utf-8 -*-
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => "AKIAJ5ESOWUZZ7QQALTQ",                            # required
    :aws_secret_access_key  => "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",                        # required
    :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
    :host                   => 's3-ap-northeast-1.amazonaws.com',             # optional, defaults to nil
    :endpoint               => 'https://s3-ap-northeast-1.amazonaws.com' # optional, defaults to nil
  }
  
  config.fog_directory  = 'hackathon-challenge-dev'                 # required
  config.fog_public     = true                          # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

end
