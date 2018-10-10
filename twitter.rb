# frozen_string_literal: true

# ligne tres importante qui appelle la gem.
# Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'

# Appelle la gem dotenv
require 'dotenv'

# Ceci appelle le fichier .env grace à la gem dotenv,
# et enregistre toutes les donnees enregistrees dans une hash ENV
Dotenv.load

# quelques lignes qui enregistrent les cles d'APIs
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end
p client

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
