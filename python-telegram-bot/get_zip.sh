docker build -t lambda-python-telegram-bot .
rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambda-python-telegram-bot cp /app/pack.zip /outputs
