# Andy Quinn Dec 10 - email@aquinn.net
#
# You must supply the data first in config/user_data.yml
#
# Operation.
# Grabs random word pair from wordlist
# Create a link to dict.cc using the first word
# Shorten this link using Bitly
# Create a Tweet containing word pair and shortened link
# Send the Tweet

require 'pathname' 
require 'rubygems'
require 'sqlite3'
require 'twitter'
require 'bitly'
require 'yaml'


class LanguageTweets

   $this_dir = Pathname.new(File.dirname(__FILE__))

   Yml = YAML.load_file $this_dir + "config/user_data.yml"

   def grab_random_word
      random_line_number = rand(Yml['dict']['lines'])+1
      db = SQLite3::Database.new( $this_dir + "dict/words.db" )
      words = db.execute("select f2,f3 from word_list where f1 = :line", "line" => random_line_number)
   end

   def shorten_url(word)
      login = Yml['bitly']['login']
      api_key = Yml['bitly']['api_key']
      base_url = Yml['bitly']['base_url']
      Bitly.use_api_version_3
      bitly = Bitly.new(login, api_key)
      url = base_url + word
      shortened_url = bitly.shorten(url)
      return shortened_url.short_url
   end

   def compose_tweet(word1, word2, url)
      tweet =  word1 + " : " + word2 + " " + url
      if tweet.length > 116
         raise IndexError, "Tweet too long" 
      else 
         return tweet
      end

   end


   Twitter.configure do |config|
      config.consumer_key = Yml['twitter']['consumer_key']
      config.consumer_secret = Yml['twitter']['consumer_secret']
      config.oauth_token = Yml['twitter']['oauth_token']
      config.oauth_token_secret = Yml['twitter']['oauth_token_secret']
   end

   def send_tweet(tweet)
      client = Twitter::Client.new
      client.update(tweet)
   end
end

