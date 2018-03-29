#!/usr/bin/env python
import os
import django
django.setup()

from django.contrib.auth import get_user_model

User = get_user_model()

if User.objects.count() == 0:
    print("Creating superuser")
    User.objects.create_superuser(
        os.environ['SUPERUSER_USERNAME'],
        os.environ['SUPERUSER_EMAIL'],
        password=os.environ['SUPERUSER_PASSWORD']
    )
else:
    print("Superuser already created")
