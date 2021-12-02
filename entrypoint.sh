#!/bin/sh

timeout -s 9 300 python manage.py makemigrations
if [ $? -ne 0 ]; then
    echo "Make migrations Error"
    exit $?
fi

timeout -s 9 300 python manage.py migrate
if [ $? -ne 0 ]; then
    echo "Migrate Error"
    exit $?
fi

timeout -s 9 10 nginx
if [ $? -ne 0 ]; then
    echo "Nginx Error"
    exit $?
fi

timeout -s 9 10 nginx -s reload
if [ $? -ne 0 ]; then
    echo "Nginx Error"
    exit $?
fi

gunicorn myproject.wsgi:application --bind 0.0.0.0:8000 --workers $NUM_WORKERS
if [ $? -ne 0 ]; then
    echo "Gunicorn Error"
    exit $?
fi