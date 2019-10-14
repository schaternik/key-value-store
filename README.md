# key-value store

## Description

API for key-value store application.

## Implementation details

Application is a simple Rack-based Ruby server build with [roda](https://github.com/jeremyevans/roda). To create a single point of control for logger and Redis instance, [dry-container](https://github.com/dry-rb/dry-container) is used. All logic is distributed within service objects.

As application is an API there are [specs](https://rspec.info) for covering all available [requests](https://github.com/rack-test/rack-test). 100% spec coverage is guaranteed with [simplecov](https://github.com/colszowka/simplecov).

[Rubocop](https://github.com/rubocop-hq/rubocop) is used for code linting and formating. Here it should be run manually but of course, can be set up using Git hooks (or other similar methods).

[Docker](https://www.docker.com) and [docker-compose](https://docs.docker.com/compose/) are needed for smooth development process.

Note 1: Service objects can be refactored:
utilizing one base service object
rewriting to interactors.

Note 2: The monitoring system will be added in the following iterations.

## Development

Copy `.env.example` to `.env` (and change vars if you want for some reason).

- start a development server `docker-compose up --build`
- run specs `docker-compose run --rm app bundle exec rspec`
- start a development console `docker-compose run --rm app bundle exec bin/console`
- run a code linter `docker-compose run --rm app bundle exec rubocop`
- run a code console `docker-compose run --rm app bundle exec bin/console`

## Features

### Functional

- [x] Get a value for a key `GET /keys/{id}`
- [x] Check if a value exists `HEAD /keys/{id}`
- [x] Delete a value `DELETE /keys/{id}`
- [x] Get all keys and values `GET /keys`
- [x] Create a record `PUT /keys`
- [x] Delete all keys and values `DELETE /keys`
- [x] Set an expiry time when adding a value `PUT /keys?expire_in=60`
- [x] Support wildcard keys when getting all values `GET /keys?filter=wo*d`

### Support

- [x] Dockerized
- [x] 100% spec coverage
- [x] Documentation
- [x] Log any output to stdout
- [ ] Integration with monitoring system
