FROM registry.gitlab.com/gitlab-org/release-cli:latest AS release-cli

FROM docker:20.10.16-git

ENV BUILDX_VERSION v0.8.2

COPY ./scripts /usr/local/bin/

COPY --from=release-cli /usr/local/bin/release-cli /usr/local/bin/release-cli

RUN apk add --no-cache curl jq openssh-client nodejs npm && \
    # download && install buildx release
    CLI_PLUGINS_DIR="/usr/local/libexec/docker/cli-plugins" && \
    mkdir -p "${CLI_PLUGINS_DIR}" && \
    curl -s -L "https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64" \
        -o "${CLI_PLUGINS_DIR}/docker-buildx" && \
    chmod +x "${CLI_PLUGINS_DIR}/docker-buildx" && \
    # update npm to latest
    npm install -g npm@latest && \
    # eslint + handpick
    npm install -g eslint handpick && \
    # chmod scripts
    chmod +x /usr/local/bin/git-log-diff && \
    chmod +x /usr/local/bin/gitlab-build-docker-image && \
    chmod +x /usr/local/bin/setup-ssh
