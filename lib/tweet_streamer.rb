ENV["RAILS_ENV"] ||= "production"

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join(root, 'config', 'environment')

log = File.join(root, 'log', 'stream.log')

TweetStream.configure do |config|
    config.consumer_key       = 'key'
    config.consumer_secret    = 'secret'
    config.oauth_token        = 'token'
    config.oauth_token_secret = 'token secret'
    config.auth_method        = :oauth
  end

daemon = TweetStream::Daemon.new('tweet_streamer', log_output: true)
daemon.on_inited do
  ActiveRecord::Base.connection.reconnect!
  ActiveRecord::Base.logger = Logger.new(File.open(log, 'a'))
end
daemon.track('term') do |status|
  ::Tweet.create_from_status(status)
end
