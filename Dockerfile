FROM alpine:latest

# Get some buildtime dependencies, like terraform and aws-cli
COPY install_deps.sh ./
RUN ./install_deps.sh

WORKDIR /opt/terra-astra/src/

COPY cli.sh init.sh ./
COPY buildstore/main.tf buildstore/terraform.tf ./buildstore/
COPY deployment/main.tf deployment/terraform.tf ./deployment/
RUN ./init.sh

ENTRYPOINT [ "./cli.sh" ]