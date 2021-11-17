# README

##### Задание на должность Ruby-разработчика
Необходимо написать сервис по сжатию изображений.
##### Логика работы сервиса
- Пользователь загружает изображение;
- Изображение помещается в очередь на сжатие;
- Если сжатие произошло успешно то на email пользователя отправляется письмо со ссылкой на
скачивание сжатого изображения;
- Если не получилось сжать изображение то на email пользователя отправляется письмо с
сообщением о том что не удалось сжать изображение.

###### API
- POST multipart/form-data​ ​ http://localhost:port/images/compress
Загрузка изображения на сервер.
    - Параметры:
        ■ email, string, обязательный - валидный email пользователя
        ■ image_file, multipart/form-data, обязательный - файл с изображением
    - После того как изображение успешно сохранилось на стороне сервера ставится фоновая
задача по сжатию изображения;
    - Если сжатие произошло успешно то на email пользователя отправляется письмо со
ссылкой на скачивание сжатого изображения;
    - Если не получилось сжать изображение то на email пользователя отправляется письмо с
сообщением о том что не удалось сжать изображение.
- GET ​ http://localhost​ :port/images/:uuid/download
Получение сжатого изображения.
    - Параметры:
        ■ uuid, string, обязательный - uuid по которому пользователя может получить сжатое
изображение.

##### Условия выполнения задания
- Время на выполнение задания - 1 день;
- Репозиторий на GitHub;
- Docker Compose:
    - web, API;
    - workers, Sidekiq;
    - Redis;
    - DB, если потребуется.
- Наличие Readme с описанием сути сервиса и инструкциями как запускать и использовать
сервис.

##### Развертывание проекта
Клонирование:

```
$ git clone git@github.com:Esgeri/artec3d-test-app-image-compressor.git
```

Конфигурация базы данных:

```
$ cp config/database.yml.example config/database.yml
```
> development:
      adapter: postgresql
      encoding: unicode
      database: artec3d_image_compressor_development
      pool: 5
      host: localhost
      username: postgres
      password: ''

> test:
      adapter: postgresql
      encoding: unicode
      database: artec3d_image_compressor_test
      pool: 5
      username: postgres
      password: ''

> staging:
    url: <%= ENV['DATABASE_URL'] %>

> production:
    url: <%= ENV['DATABASE_URL'] %>

```
$ bundle install
$ rails db:create
$ rails db:migrate
```

Запуск приложения
```
$ rails s
```

Запуск Sidekiq
На другом терминале:
```
$ bundle exec sidekiq --environment development -C config/sidekiq.yml
```

##### Загрузка картин

Отправка POST запроса
```sh
http://localhost:3000/images/compress
```
Параметры
- email
- image_file

```
$ curl \
    -F "email=your_email@gmail.com" \
    -F "image_file=@/home/user/Downloads/filename.jpg" \ http://localhost:3000/images/compress
```

## License

MIT

**Тестовое приложение, Artec3d**
