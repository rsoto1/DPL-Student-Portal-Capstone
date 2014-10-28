#web: bundle exec puma -t ${PUMA_MIN_THREADS:-8}:${PUMA_MAX_THREADS:-1} -w ${PUMA_WORKERS:-3} -p $PORT -e ${RACK_ENV:-development}
web: bundle exec puma -C config/puma.rb
