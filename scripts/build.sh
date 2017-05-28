#!/bin/bash

set -eo pipefail

# Clone git repository master
git clone git@github.com:MarineBaron/testdrupal.git

# Install merge plugin.
docker run --rm \
    -v "$HOME/.composer":/composer \
    -v "$PWD":/app \
    composer/composer:alpine update -n

composer install
