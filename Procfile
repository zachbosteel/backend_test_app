web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: bundle exec sidekiq -e production -C config/sidekiq.yml
resque: env TERM_CHILD=1 bundle exec rake resque:work QUEUES=*