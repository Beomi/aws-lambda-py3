rm -rf $(pwd)/*.zip
docker run -v $(pwd):/outputs -it lambdalayer-tensorflow-v2 bash -c "cp /app/pack.zip /outputs && cp /app/pack_tf.zip /outputs"
