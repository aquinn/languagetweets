require 'pathname'

$this_dir = Pathname.new(File.dirname(__FILE__))

require $this_dir + "language_tweets"

lt = LanguageTweets.new
word_pair = lt.grab_random_word
url = lt.shorten_url(word_pair[0][0])
tweet = lt.compose_tweet(word_pair[0][0], word_pair[0][1], url)
lt.send_tweet(tweet)
