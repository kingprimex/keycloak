# Keycloak quarkus distribution suitable for k8s environments
## Phase I
````
1. Build an image with `--cache-stack=kubernetes` as in `Dockerfile` or use `--auto-build --cache-stack=kubernetes` as CMD parameters
2. Make sure at build you specify also `--db=<DB_TYPE>` or with `--auto-build` ENV `KC_DB: <DB_TYPE>` to add your desired DB dependency
3. After building with `--cache-stack=kubernetes` make sure you specify at RUNTIME the ENV variable `JAVA_OPTS_APPEND: -Djgroups.dns.query=<kubernetes_headless_svc>`
4. Also make sure to specify the `KC_HOSTNAME` and `KC_PROXY: edge(to allow http requests but behind a balancer) `
5. An example able to run in k8s is presented in the `docker-compose.yml` file in PRODUCTION MODE.
````