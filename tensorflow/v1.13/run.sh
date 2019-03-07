rm -rf $(pwd)/pack.zip
docker run -v $(pwd):/outputs -it lambdalayer-tensorflow-v1-13 cp /app/pack.zip /outputs
