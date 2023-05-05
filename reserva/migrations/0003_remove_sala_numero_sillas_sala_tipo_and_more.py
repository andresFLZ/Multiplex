# Generated by Django 4.1.5 on 2023-05-05 18:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('reserva', '0002_alter_reserva_usuario_id'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sala',
            name='numero_sillas',
        ),
        migrations.AddField(
            model_name='sala',
            name='tipo',
            field=models.IntegerField(choices=[[1, '1 (50 sillas)'], [2, '2 (60 sillas)'], [3, '3 (70 sillas)']], default=1, verbose_name='tipo de sala'),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='correo',
            field=models.EmailField(max_length=254),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='puntos',
            field=models.IntegerField(default=0),
        ),
        migrations.CreateModel(
            name='sillasDisponibles',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('num_sillas_dispo', models.IntegerField()),
                ('sillas_dispo', models.CharField(max_length=200)),
                ('funcion_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='reserva.funcion', verbose_name='función')),
            ],
            options={
                'verbose_name': 'sillas disponibles',
                'verbose_name_plural': 'sillas disponibles',
                'db_table': 'Sillas_disponibles',
            },
        ),
    ]
