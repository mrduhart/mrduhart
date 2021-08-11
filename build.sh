export JEKYLL_ENV="development"
export JEKYLL_CONFIG="_config.yml,_config-dev.yml"
export JEKYLL_HOST="0.0.0.0"
export GEM_GREP="jekyll-feed"

if ! bundle list | grep -q "$GEM_GREP"; then
  rm Gemfile.lock && \
  bundle install
fi

while getopts "ph:" arg; do
  case $arg in
    p)
      export JEKYLL_ENV="production"
      export JEKYLL_CONFIG="_config.yml"
      ;;
    h)
      export JEKYLL_HOST=${OPTARG}
      ;;
  esac
done

echo "JEKYLL_ENV=$JEKYLL_ENV"
bundle exec jekyll serve --config $JEKYLL_CONFIG --host $JEKYLL_HOST --force-polling
