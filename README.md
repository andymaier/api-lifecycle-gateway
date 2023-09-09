# API Gateway for the Lifecycle Demo

Konfiguration für das [API Gateway](https://github.com/membrane/service-proxy) des API Lifecycle Beispiels.

## Setup Azure

1. Create Wep App

```
az webapp create --name lifecycle-membrane-gw \
--plan small \
--resource-group demo \
--deployment-container-image-name ghcr.io/predic8/api-lifecycle-gateway:latest
```

2. Download Publish Profile

2. s

Settings/Secrets and Variables/Actions

New Repository Secret

AZ_PUBLISH_PROFILE

Name:
AZ_PUBLISH_PROFILE

Content: << Inhalt des Files