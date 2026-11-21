#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate
python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); u = User.objects.filter(username='admin').first(); u.set_password('@Bullim2023') if u else User.objects.create_superuser('admin', 'bullimagana@gmail.com', '@Bullim2023'); u.save() if u else None"
