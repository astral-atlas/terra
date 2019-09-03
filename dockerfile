FROM alpine:latest

# Get some buildtime depdencenceis, like terraform and aws-cli
COPY install_deps.sh ./
RUN ./install_deps.sh

WORKDIR /opt/terra-astra/src/

COPY cli.sh buildstore deployment ./

ENTRYPOINT [ "./cli.sh" ]