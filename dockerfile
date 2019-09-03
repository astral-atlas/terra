FROM alpine:edge

# Get some buildtime depdencenceis, like terraform and aws-cli
COPY ./install_deps.sh ./install_deps.sh
RUN ./install_deps.sh

WORKDIR /usr/

COPY ./ ./