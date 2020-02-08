rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-requests-html cp /app/pack.zip /outputs
