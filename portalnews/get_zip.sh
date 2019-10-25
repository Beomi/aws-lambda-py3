rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-portalnews cp /app/pack.zip /outputs
