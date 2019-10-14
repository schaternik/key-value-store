# key-value store

## Description

API for key-value store application.

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

## Development

- start a development server `docker-compose up --build`
- run specs `docker-compose run --rm app bundle exec rspec`
- start a development console `docker-compose run --rm app bundle exec bin/console`
- run a code linter `docker-compose run --rm app bundle exec rubocop`
- run a code console `docker-compose run --rm app bundle exec bin/console`
