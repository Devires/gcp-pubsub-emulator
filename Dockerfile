FROM google/cloud-sdk:alpine

RUN apk --update add openjdk8-jre git wget build-base python python-dev python3 python3-dev

RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py

RUN gcloud components install --quiet beta pubsub-emulator

RUN git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git \
    && cd python-docs-samples/pubsub/cloud-client \
    && pip install -r requirements.txt

WORKDIR python-docs-samples/pubsub/cloud-client

ENV PUBSUB_EMULATOR_HOST 0.0.0.0:8085

ENTRYPOINT ["gcloud", "beta", "emulators", "pubsub", "start", "--host-port=0.0.0.0:8085"]

EXPOSE 8085