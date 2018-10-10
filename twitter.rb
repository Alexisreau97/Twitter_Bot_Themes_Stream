# Voici ton programme

# ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'

# Appelle la gem dotenv
require 'dotenv'

# Ceci appelle le fichier .env grâce à la gem dotenv, et enregistre toutes les données enregistrées dans une hash ENV
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end
p client