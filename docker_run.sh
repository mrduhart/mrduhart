export JEKYLL_TAG="pages"
export CONTAINER_NAME="mrduhart-jekyll"

docker run --rm -it \
  --name $CONTAINER_NAME \
  -p 4000:4000 \
  -v "$PWD:/srv/jekyll" \
  jekyll/jekyll:$JEKYLL_TAG \
  bash
