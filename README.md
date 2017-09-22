# Docker-rails base image


A minimalistic baseimage that supports development through docker hopefully
without negative impact on production containers


`project_template/` contains files that should exist in a project that uses this image.

Usage:

    # start rails as a developer.
    docker-compose up dev

    # drop into the project's bash where ruby is available
    docker-compose run --rm dev bash

### Using build-dependencies

In order to keep your final image small, it's recommended to separate your
dependencies into two categories `runtime` and `build`. 

Use Virtual targets to add and purge packages within the same run-command.

    RUN apk add --no-cache --virtual .build-deps \
      list of dependencies \
      && ./build_command \
      && apk del .build-deps



