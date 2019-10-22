rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-pandas-explode cp /app/pack.zip /outputs
