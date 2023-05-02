# Generated by Django 4.1.5 on 2023-05-02 17:59

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Pelicula',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=30)),
                ('director', models.CharField(max_length=30)),
                ('clasificacion', models.IntegerField()),
                ('lenguaje', models.IntegerField()),
                ('fecha_estreno', models.DateField(verbose_name='fecha de estreno')),
                ('puntuacion', models.IntegerField()),
                ('imagen', models.CharField(max_length=250)),
            ],
            options={
                'verbose_name': 'pelicula',
                'verbose_name_plural': 'peliculas',
                'db_table': 'Pelicula',
            },
        ),
    ]