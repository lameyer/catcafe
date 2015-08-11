OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_APP_KEY'], ENV['FB_APP_SECRET'],
           :scope => 'public_profile'
end
