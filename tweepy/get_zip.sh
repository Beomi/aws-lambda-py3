rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-tweepy cp /app/pack.zip /outputs
