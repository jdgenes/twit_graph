# Twitterpated

To run:

Configure database.yml

Generate secrets.yml

Run the streaming service with "ruby ./lib/tweet_streamer.rb start"

Use clockwork gem to schedule weekly DB wipes: "clockwork /app/clock.rb"

