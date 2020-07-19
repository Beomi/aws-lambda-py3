docker build -t lambda-slackclient .
rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-slackclient cp /app/pack.zip /outputs
