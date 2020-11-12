# docker-builder

Docker image used to build other docker images

## Available scripts

### gitlab-build-docker-image

usage:
```
gitlab-build-docker-image Dockerfile registry-image/ref registry-cache-image/ref
```

If not specified, will use  Gitlab's `$CI_REGISTRY_IMAGE` variable for image and `$CI_REGISTRY_IMAGE/buildcache` for cache
   