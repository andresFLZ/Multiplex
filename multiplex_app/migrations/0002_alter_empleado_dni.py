# Generated by Django 4.1.5 on 2023-05-04 16:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('multiplex_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='empleado',
            name='dni',
            field=models.CharField(max_length=25, primary_key=True, serialize=False, unique=True),
        ),
    ]