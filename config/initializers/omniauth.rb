Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "XXzgXHemILJnozLPr9wwTnVJM", "aJZ1flhWup3FVHmfQUZescscBRQPkhQSKyZbxXRtsvbtXJ0OIA", { secure_image_url: 'true', image_size: 'original' }
end