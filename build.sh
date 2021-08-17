export JEKYLL_ENV="development"
export JEKYLL_CONFIG="_config.yml,_config-dev.yml"
export JEKYLL_HOST="0.0.0.0"
export GEM_GREP="jekyll-feed"

while getopts "h:ip" arg; do
  case $arg in
    h)
      export JEKYLL_HOST=${OPTARG}
      ;;
    i)
      rm Gemfile.lock && \
      bundle install
      ;;
    p)
      export JEKYLL_ENV="production"
      export JEKYLL_CONFIG="_config.yml"
      ;;
  esac
done

echo "JEKYLL_ENV=$JEKYLL_ENV"
bundle exec jekyll serve --config $JEKYLL_CONFIG --host $JEKYLL_HOST --force-polling
