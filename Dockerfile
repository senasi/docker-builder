FROM registry.gitlab.com/gitlab-org/release-cli:latest AS release-cli

FROM docker:28.0.1-cli-alpine3.21

COPY ./scripts /usr/local/bin/

COPY --from=release-cli /usr/local/bin/release-cli /usr/local/bin/release-cli

RUN apk add --no-cache  \
    git  \
    curl  \
    curl-dev \
    jq  \
    openssh-client  \
#    nodejs  \
#    npm  \
    php  \
    php-phar  \
    php-iconv  \
    php-mbstring  \
    php-openssl  \
    && \
    # composer
    wget https://getcomposer.org/installer -O - -q | php -- --install-dir=/usr/local/bin --filename=composer && \
    # chmod scripts
    chmod +x /usr/local/bin/git-log-diff && \
    chmod +x /usr/local/bin/gitlab-build-docker-image && \
    chmod +x /usr/local/bin/setup-ssh
