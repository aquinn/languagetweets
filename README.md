# Language Tweets

I wanted to create a twitter app that would send me a couple of
words everyday to improve my vocabulary. This code is the result.
Paul Hemetsberger of <http://dict.cc> saved me from having to
compile my own wordlist

1. Get the word list off dict.cc and let Paul know.
<http://www1.dict.cc/translation_file_request.php?l=e>

2. Setup the twitter account you want

3. Get the api codes from <http://dev.twitter.com>

4. Setup <http://bit.ly> account and get the codes

5. Put all the info into config/user_info.yml

6. Add dict.cc data to database.
 
   I used Sqlite3 and Sqlitebrowser to import the csv file.

7. Add line to Cron table to execute as many times a day as you want

   This is for twice a day - 12pm and 3pm

   0 12,15 * * *       /usr/bin/ruby /home/user/scripts/languagetweets/run.rb


In the wild..

<http://twitter.com/twogermantweets>

<http://twitter.com/polishtweets>
