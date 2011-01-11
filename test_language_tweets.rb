require 'language_tweets'
require 'test/unit'

class TestLanguageTweets < Test::Unit::TestCase

   def setup
      @language_tweets = LanguageTweets.new
   end

   def test_return_a_non_nil_word_pair
      assert_not_nil(@language_tweets.grab_random_word)
   end

   def test_raises_error_when_tweet_is_longer_than_116_chars
      # 140 is twitter limit so 116 because of bitly link and display characters
      lang1 = "hfhfhfafhufhidfhsfhdisuhfidsuhfiudhsihfidsfhdishfdisfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsf"
      lang2 = "fdoifjoeijfoaijfoeaifjoaeijfoaiejfoaiejfoaejfiejofjaoifjeoaijfoejaofijeoaifjoeajfoijfoae"
      url = "bitlyblah"
      
      assert_raises( IndexError ) { 
         @language_tweets.compose_tweet(lang1,lang2,url) 
      }
   end
end

