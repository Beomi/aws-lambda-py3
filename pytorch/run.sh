rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it py3torch cp /app/pack.zip /outputs
