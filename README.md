# docker-builder

Docker image used to build other docker images

## Available tools & scripts

### gitlab-build-docker-image

usage:
```
gitlab-build-docker-image Dockerfile registry-image/ref:tag registry-cache-image/ref:tag
```

If not specified, will use  Gitlab's `$CI_REGISTRY_IMAGE` variable for image and `$CI_REGISTRY_IMAGE/buildcache` for cache

### setup-ssh

This script will install private key (via ssh-agent) and optionally write contents of `~/.ssh/known_hosts` file. 

usage:
```
setup-ssh "BASE64_ENCODED_PRIVATE_KEY" ["CONTENT_OF_KNOWN_HOSTS_FILE"] 
```

will use following environment variables if arguments are missing:
- SSH_PRIVATE_KEY_BASE64
- SSH_KNOWN_HOSTS
   
### release-cli

Gitlab's own Release Command Line

> The Release CLI is a command-line tool for managing GitLab Releases from the command line or from the GitLab CI/CD configuration file, .gitlab-ci.yml.

see: https://docs.gitlab.com/ee/user/project/releases/#release-command-line
