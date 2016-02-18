if ENV['SECRET_TOKEN'].present?
  OpenworksStatusApi::Application.config.secret_key_base = ENV['SECRET_TOKEN']
  OpenworksStatusApi::Application.config.secret_token = ENV['SECRET_TOKEN']
end