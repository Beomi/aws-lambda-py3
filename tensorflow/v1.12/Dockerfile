FROM amazonlinux:1

RUN mkdir /app
RUN mkdir /app/packs
RUN mkdir /app/python

WORKDIR /app

RUN yum install -y python36 python36-dev python36-pip \
    findutils binutils zlib-devel zip

RUN python3 -m pip install -U pip wheel

ENV PYTHONUSERBASE=/app/packs
RUN python3 -m pip install --user "tensorflow<1.13"
RUN echo "original size $(du -sh /app/packs | cut -f1)"

RUN find . -name "*.so" -not -path "/app/packs/lib/python3.6/site-packages/PIL/*" | xargs strip
RUN find . -name "*.so.*" -not -path "/app/packs/lib/python3.6/site-packages/PIL/*" | xargs strip
RUN find . -name \*.pyc -delete

# RUN ls
RUN echo "stripped size $(du -sh /app/packs | cut -f1)"

RUN cp -R /app/packs/lib/python3.6/site-packages/* /app/python

RUN zip -FS -r1 /app/pack.zip python > /dev/null
RUN echo "compressed size $(du -sh /app/pack.zip | cut -f1)"

CMD bash
