# Property scheduled viewing POC

See [Solution](solution.md) for implementation details

## Technical Stack
- Rails 8.1
- Turbo + Stimulus (for UI interaction)
- Postgres 16
- Bootstrap 5
- Docker (to containerize local development, details below)

## Development Setup

This proof of concept (POC) is fully dockerised with database and seed data. Follow below instruction to boot up the app locally.

**Startup all containers**
```
$ bin/startup
```
Visit `http://localhost:3000` to see the app in action

**Full test suite**
````
$ bin/task spec
````
**Navigations**

The application has two separate views, tenant and admin views
- Tenant (http://localhost:3000): Tenant can view property and book for viewing
- Admin (http://localhost:3000/admin): Property manager can schedule viewings and see who booked viewings

  Credentials:

  - username: admin@localhost.com
  - password: Password1234!

