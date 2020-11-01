FROM docker:19

ENV BUILDX_VERSION v0.4.2

RUN CLI_PLUGINS_DIR="/usr/local/libexec/docker/cli-plugins" && \
    apk add --no-cache curl jq openssh-client && \
    mkdir -p "${CLI_PLUGINS_DIR}" && \
    curl -s -L "https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64" \
        -o "${CLI_PLUGINS_DIR}/docker-buildx" && \
    chmod +x "${CLI_PLUGINS_DIR}/docker-buildx"

# COPY ./.ssh /root/.ssh
