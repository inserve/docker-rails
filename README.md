# Docker-rails base image


A baseimage that supports development through docker
hopefully without negative impact on production containers


`project_template/` contains files that should exist in a project that uses this image.

Usage:

    # start rails as a developer.
    docker-compose run dev

    # drop into the project's bash where ruby is available
    docker-compose run dev bash
