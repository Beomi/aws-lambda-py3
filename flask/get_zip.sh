rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-flask cp /app/pack.zip /outputs
