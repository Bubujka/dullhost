# sakura

Это скрипт, который сделает из ubuntu 14.04 хостинг для php проектов.

# Установка

Под суперпользователем выполняем команду, которая скачает самую свежую версию sakura
и запустит процесс установки:

```sh
wget -O - https://raw.github.com/Bubujka/sakura/master/autoinstall | bash
```

## Добавление ключей разработчика

```sh
cat ~/.ssh/id_rsa.pub | ssh root@YOUR_DOMAIN.RU 'sakura upload-key YOUR_USER_NAME'
```

## Обновление

```sh
sakura self-update
```

# Команды

* cat ~/.ssh/id_rsa.pub | sakura upload-key $MY_NAME
* sakura self-update
* sakura regenerate-configs
* sakura delete $PRJ_NAME


# Соглашения у проектов

У каждого проекта, что будет развёрнут, должен быть:
- файл *CNAME* со списком доменов через пробел
- файл *nginx.conf* без указания server{}, root, listen, server_name
- имя проекта должно соответствовать формату **/^[a-z][a-z0-9_-']$/**

По желанию:
- в nginx.conf проекта можно записать 'include php_fastcgi;' или 'include php_fastcgi_internal;'
- если у проекта будет папка www, то nginx установит $document_root на неё
- если у проекта есть файл 'crontab' то он установлен для пользователя проекта


# Репозиторий env

В нём могут быть следующие файлы
- env - настройки что будут переданы php, crontab, консоли
  Пример:
	```sh
  env='production'
  MYSQL_CONNECTION='mysql://root:qwerty@localhost/database'
	```

- msmtprc - настройки для почты (чтобы работала функция mail())
  Пример:
	```ini
  account default
  host smtp.yandex.ru
  port 587
  protocol smtp
  auth on
  from admin@bubujka.org
  user admin@bubujka.org
  password OlolOloll1
  tls on
  tls_starttls on
  tls_certcheck off
  logfile /home/myusername/msmtp.log
	```

- authorized_keys - ключи людей, что будут выполнять консольные команды


# Специальные репозитории
- env - содержит настройки окружения что будут переданы php
- default_server - проект, который будет отображаться по умолчанию

# Где тестировалось
- ubuntu 14.04 x64 - должна работать

# Установка postfix

Под суперпользователем:

```sh
sakura install-postfix DOMAIN.RU
```

