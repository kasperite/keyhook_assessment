# Property scheduled viewing POC

## Technical Stack
- Rails 8.1
- Postgres 16
- Bootstrap 5
- Docker (to containerize local development, details below)

## Development Setup

The proof of concept (POC) is fully dockerised with database and seed data. Follow below instruction to boot up the app locally.

**Startup all containers**
```
$ bin/startup
```
Visit `http://localhost:3000` to see the app in action

**Full test suite**
````
$ bin/task spec
````