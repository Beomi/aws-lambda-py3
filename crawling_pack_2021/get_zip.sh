rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-crawling-pack-2021 cp /app/pack.zip /outputs
