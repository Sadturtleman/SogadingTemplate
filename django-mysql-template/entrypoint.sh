#!/bin/bash
set -e

echo "Waiting for DB ${DB_HOST}:${DB_PORT}..."
until nc -z $DB_HOST $DB_PORT; do
  echo "DB is unavailable - sleeping"
  sleep 1
done

echo "DB is up - running migrations"
python manage.py migrate

echo "Starting Gunicorn..."
gunicorn project.wsgi:application --bind 0.0.0.0:8000
