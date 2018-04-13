#!/usr/bin/env python
import os
import django

os.environ['DJANGO_SETTINGS_MODULE'] = 'misagodocker.settings'

django.setup()

from django.contrib.auth import get_user_model

User = get_user_model()

if User.objects.count() == 0:
    print("Creating superuser")
    User.objects.create_superuser(
        os.environ['MISAGO_SUPERUSER_USERNAME'],
        os.environ['MISAGO_SUPERUSER_EMAIL'],
        password=os.environ['MISAGO_SUPERUSER_PASSWORD']
    )
else:
    print("Superuser already created")
