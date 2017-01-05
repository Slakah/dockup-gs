FROM alpine:3.5

RUN apk add --update curl python tini && rm -rf /var/cache/apk/*
RUN mkdir /opt/
RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-138.0.0-linux-x86_64.tar.gz --create-dirs -o /opt/google-cloud-sdk.tar.gz \
  && tar -xf /opt/google-cloud-sdk.tar.gz -C /opt/ \
  && rm /opt/google-cloud-sdk.tar.gz

ENV PATH=$PATH:/opt/google-cloud-sdk/bin/

COPY bin/* /usr/local/bin/
ENTRYPOINT ["tini", "--", "dockup-gs"]
