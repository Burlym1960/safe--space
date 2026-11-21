#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate
python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); u, created = User.objects.get_or_create(username='admin', defaults={'email': 'bullimagana@gmail.com'}); u.set_password('@Bullim2023'); u.is_superuser = True; u.is_staff = True; u.save()"
