# Generated by Django 4.1.5 on 2023-05-11 23:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('multiplex_app', '0003_alter_cine_ciudad_alter_empleado_cargo'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cine',
            name='peliculas',
        ),
    ]
