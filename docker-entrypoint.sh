#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Remove a potentially leftover development server PID file
if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

# Run database migrations (or setup if migration fails)
echo "Running database migrations..."
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:setup

# Then exec the container's main process (CMD in the Dockerfile)
exec "$@"