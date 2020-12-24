# docker-builder

Docker image used to build other docker images

## Available tools & scripts

### gitlab-build-docker-image

usage:
```
gitlab-build-docker-image Dockerfile registry-image/ref:tag registry-cache-image/ref:tag
```

If not specified, will use  Gitlab's `$CI_REGISTRY_IMAGE` variable for image and `$CI_REGISTRY_IMAGE/buildcache` for cache
   
### release-cli

Gitlab's own Release Command Line

> The Release CLI is a command-line tool for managing GitLab Releases from the command line or from the GitLab CI/CD configuration file, .gitlab-ci.yml.

see: https://docs.gitlab.com/ee/user/project/releases/#release-command-line
