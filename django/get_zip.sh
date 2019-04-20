rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-django cp /app/pack.zip /outputs
