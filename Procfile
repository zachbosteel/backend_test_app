web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
resque: env TERM_CHILD=1 QUEUE=* bundle exec rake resque:work
worker: bundle exec sidekiq -e production -C config/sidekiq.yml