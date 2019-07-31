rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-twint cp /app/pack.zip /outputs
