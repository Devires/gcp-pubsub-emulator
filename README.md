# Google Cloud PubSub Emulator bootstrap for development purposes

> Created by **Devires Consulting** | http://devires.com.br/

## Build Image
```
docker build -t devires/gcp-pubsub-emulator .
```

## Run Image
```
docker run --name gcp-pubsub-emulator -d -p 8085:8085 devires/gcp-pubsub-emulator
```

## Create Topic
```
docker exec -it gcp-pubsub-emulator python publisher.py mytestprj create MyTestTopic
```