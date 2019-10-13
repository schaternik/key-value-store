# key-value store

## Description

API for key-value store application.

## Features

### Functional

- [ ] Get a value for a key `GET /keys/{id}`
- [ ] Create a record `PUT /keys`
- [ ] Get all keys and values
- [ ] Check if a value exists `HEAD /keys/{id}`
- [ ] Delete a value `DELETE /keys/{id}`
- [ ] Set an expiry time when adding a value `PUT /keys?expire_in=60`
- [ ] Support wildcard keys when getting all values `GET /keys?filter=wo$d`

### Support

- [x] Dockerized
- [ ] 100% spec coverage
- [ ] Documentation
- [ ] Log any output to stdout
- [ ] Integration with monitoring system

## Development

- start a development server `docker-compose up --build`
- run specs `docker-compose run --rm app bundle exec rspec`
- start a development console `docker-compose run --rm app bundle exec bin/console`
- run a code linter `docker-compose run --rm app bundle exec rubocop`