docker build -t lambda-requests .
rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-requests cp /app/pack.zip /outputs
