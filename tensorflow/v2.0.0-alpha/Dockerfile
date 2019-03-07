FROM amazonlinux:1

RUN mkdir /app
RUN mkdir /app/packs
RUN mkdir /app/python

WORKDIR /app

RUN yum install -y python36 python36-dev python36-pip \
    findutils binutils zlib-devel zip

RUN python3 -m pip install -U pip wheel

ENV PYTHONUSERBASE=/app/packs
RUN python3 -m pip install --user tensorflow==2.0.0-alpha0

RUN echo "original size $(du -sh /app/packs | cut -f1)"

RUN find . -name "*.so" -not -path "/app/packs/lib/python3.6/site-packages/PIL/*" | xargs strip
RUN find . -name "*.so.*" -not -path "/app/packs/lib/python3.6/site-packages/PIL/*" | xargs strip
RUN find . -name \*.pyc -delete

# RUN ls
RUN echo "stripped size $(du -sh /app/packs | cut -f1)"

# Zip tensorflow only
RUN mv /app/packs/lib/python3.6/site-packages/tensor* /app/python
RUN zip -FS -r1 /app/pack_tf.zip python > /dev/null
RUN echo "TF Only: stripped size $(du -sh /app/python | cut -f1)"
RUN echo "TF Only: compressed size $(du -sh /app/pack_tf.zip | cut -f1)"

RUN rm -rf /app/python/
RUN mkdir /app/python

RUN cp -R /app/packs/lib/python3.6/site-packages/* /app/python
RUN zip -FS -r1 /app/pack.zip python > /dev/null
RUN echo "TF Others: stripped size $(du -sh /app/python | cut -f1)"
RUN echo "TF Others: compressed size $(du -sh /app/pack.zip | cut -f1)"

CMD bash
