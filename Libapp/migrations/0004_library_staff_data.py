# Generated by Django 2.2 on 2022-06-23 18:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Libapp', '0003_library_user_data_add_remove'),
    ]

    operations = [
        migrations.CreateModel(
            name='Library_Staff_Data',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('book_id', models.BigIntegerField(blank=True, null=True)),
                ('availability', models.CharField(blank=True, max_length=20, null=True)),
                ('book_given_date', models.CharField(blank=True, max_length=200, null=True)),
                ('book_submission_date', models.CharField(blank=True, max_length=200, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='phase_one_v3', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'library_staff_details',
            },
        ),
    ]