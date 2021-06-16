FROM registry.gitlab.com/gitlab-org/release-cli:latest AS release-cli

FROM docker:20.10.7-git

ENV BUILDX_VERSION v0.5.1

ENV PHPSTAN_VERSION 0.12.89

COPY ./scripts /usr/local/bin/

COPY --from=release-cli /usr/local/bin/release-cli /usr/local/bin/release-cli

RUN apk add --no-cache curl jq openssh-client nodejs npm php7 php7-phar php7-simplexml php7-xmlwriter php7-tokenizer php7-ctype && \
    # download && install buildx release
    CLI_PLUGINS_DIR="/usr/local/libexec/docker/cli-plugins" && \
    mkdir -p "${CLI_PLUGINS_DIR}" && \
    curl -s -L "https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64" \
        -o "${CLI_PLUGINS_DIR}/docker-buildx" && \
    chmod +x "${CLI_PLUGINS_DIR}/docker-buildx" && \
    # eslint + handpick
    npm i -g eslint handpick && \
    # increase memory limit  for php
    echo "memory_limit = 1G" > /etc/php7/conf.d/99_limit.ini && \
    # phpcs
    curl -s -L "https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar" -o "/usr/local/bin/phpcs" && \
    chmod +x /usr/local/bin/phpcs && \
    # phpstan
    curl -s -L "https://github.com/phpstan/phpstan/releases/download/${PHPSTAN_VERSION}/phpstan.phar" -o "/usr/local/bin/phpstan" && \
    chmod +x /usr/local/bin/phpstan && \
    # chmod scripts
    chmod +x /usr/local/bin/gitlab-build-docker-image && \
    chmod +x /usr/local/bin/setup-ssh
