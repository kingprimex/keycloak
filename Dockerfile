FROM quay.io/keycloak/keycloak:17.0.1 as builder
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres
ENV KC_HTTP_RELATIVE_PATH=/auth
RUN /opt/keycloak/bin/kc.sh build --cache-stack=kubernetes

FROM quay.io/keycloak/keycloak:17.0.1
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
WORKDIR /opt/keycloak
#COPY themes /opt/keycloak/themes
ENTRYPOINT ["/opt/keycloak/bin/kc.sh","start"]