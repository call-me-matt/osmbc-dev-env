# OpenStreetMap Blog Collector - Development Environment

Development environment for the [OSM Blog Collector](https://github.com/TheFive/osmbc)

# Installation

set your OSM user name in the `docker-compose.yml` before first start

run `docker compose build`

run `docker compose up omgwtfssl` to create certificates

# Usage

run `docker compose up node` to start

Provides the OSM Blog Collector at https://localhost:35043 - self-signed certificates have to be accepted.

For login, chose `local/htaccess` method, the user name is your OSM user and the password is `test`.

To run tests, execute `docker compose run --entrypoint "npm test" node`

## Development

Make your changes in the `osmbc` directory.
