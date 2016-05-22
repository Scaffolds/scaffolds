Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['github_client_id'], ENV['github_client_secret']
  provider :facebook, ENV['facebook_client_id'], ENV['facebook_client_secret']
  provider :twitter, ENV['twitter_client_id'], ENV['twitter_client_secret']
end
