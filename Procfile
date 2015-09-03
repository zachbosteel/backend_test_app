web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
resque: TERM_CHILD=1 QUEUE=carrierwave,process_image bundle exec rake environment resque:work --trace
worker: bundle exec sidekiq -e production -C config/sidekiq.yml