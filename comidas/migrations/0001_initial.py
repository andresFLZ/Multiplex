# Generated by Django 4.1.5 on 2023-05-25 20:37

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('multiplex_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Snack',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20)),
                ('valor', models.IntegerField()),
                ('imagen', models.URLField()),
                ('cines', models.ManyToManyField(db_table='Multiplex_snack', to='multiplex_app.cine')),
            ],
            options={
                'verbose_name': 'snack',
                'verbose_name_plural': 'snacks',
                'db_table': 'Snack',
            },
        ),
    ]
