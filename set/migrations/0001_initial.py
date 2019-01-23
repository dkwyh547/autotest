# Generated by Django 2.1.5 on 2019-01-22 11:10

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Set',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('setname', models.CharField(max_length=64, verbose_name='系统名称')),
                ('setvalue', models.CharField(max_length=200, verbose_name='系统设置')),
            ],
            options={
                'verbose_name': '系统设置',
                'verbose_name_plural': '系统设置',
            },
        ),
    ]
