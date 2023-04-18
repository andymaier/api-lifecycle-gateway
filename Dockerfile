FROM docker.io/eclipse-temurin:17-jre-alpine

RUN mkdir /app

RUN addgroup -g 1001 -S appuser
RUN adduser -u 1001 -S appuser -G appuser
RUN chown -R appuser:appuser /app

WORKDIR /app

USER 1001

RUN wget https://github.com/membrane/service-proxy/releases/download/v5.1.0/membrane-api-gateway-5.1.0.zip -O membrane.zip
RUN unzip membrane.zip
RUN rm membrane.zip

COPY proxies.xml /app/membrane-api-gateway-5.1.0/conf/

RUN rm /app/membrane-api-gateway-5.1.0/conf/fruitshop-api.yml

RUN wget "https://gitlab.com/api/v4/projects/44417807/repository/files/rfq-api-v1.yml/raw?ref=main" \
    --header="Private-Token: glpat-q5vAKuJ8enxUyWcMKs73" -O membrane-api-gateway-5.1.0/conf/rfq-api-v1.yml

EXPOSE 80

ENTRYPOINT ["/bin/sh","/app/membrane-api-gateway-5.1.0/service-proxy.sh"]
