FROM amazonlinux:2


RUN mkdir /app
RUN mkdir /app/packs
RUN mkdir /app/python

WORKDIR /app

RUN yum install -y python3 \
    findutils binutils zlib-devel zip git

RUN python3 -m pip install -U pip wheel

ENV PYTHONUSERBASE=/app/packs
RUN python3 -m pip install --user portalnews
RUN echo "original size $(du -sh /app/packs | cut -f1)"

RUN find . -name \*.pyc -delete

# RUN ls
RUN echo "stripped size $(du -sh /app/packs | cut -f1)"

RUN cp -R /app/packs/lib /app/python/lib
# RUN cp -R /app/packs/bin/* /app/python

RUN zip -FS -r1 /app/pack.zip python > /dev/null
RUN echo "compressed size $(du -sh /app/pack.zip | cut -f1)"
RUN echo "$(python3 -m pip list | grep pandas)"

CMD bash
