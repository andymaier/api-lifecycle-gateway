FROM docker.io/eclipse-temurin:17-jre-alpine

RUN mkdir /app

WORKDIR /app

RUN wget https://github.com/membrane/service-proxy/releases/download/v5.2.0/membrane-api-gateway-5.2.0.zip -O membrane.zip
RUN unzip membrane.zip
RUN rm membrane.zip

COPY proxies.xml /app/membrane-api-gateway-5.2.0/conf/

RUN rm /app/membrane-api-gateway-5.2.0/conf/fruitshop-api.yml

RUN wget "https://github.com/andymaier/rfq-api/releases/latest/download/rfq-api-v1.oas.yml" -O membrane-api-gateway-5.2.0/conf/rfq-api-v1.yml

EXPOSE 80

ENTRYPOINT ["/bin/sh","/app/membrane-api-gateway-5.2.0/service-proxy.sh"]
