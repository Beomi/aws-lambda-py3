rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-pandas cp /app/pack.zip /outputs
