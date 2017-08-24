# Yibuio

[yibuio](https://yibuio.herokuapp.com/) community source

异步IO 是基于评分和标签的论坛，灵感来自于 Reddit, 可以认为是精简的开源实现

Yibuio is a simple and elegant forum, inspired from Reddit.

## DEMO

https://yibuio.herokuapp.com/

## Deploy

```
clone git@github.com:jjyr/yibu.io.git
cd yibu.io

bundle install

# configuration config/settings.yml
export DATABASE_URL={your database url}

# setup database
export RAILS_ENV=production
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

# start web
bundle exec rails server
# start worker
bundle exec sidekiq
```

## Deploy With Docker

1. Modify `config/settings.yml` and `docker-compose.yml` options
2. Install `docker-compose`
3. Run `docker-compose up -d --build` to start services
4. Init database
   ```
   docker-compose run web rails db:create
   docker-compose run web rails db:migrate
   docker-compose run web rails db:seed
   ```
7. Visit http://0.0.0.0:3000

## Contribution

1. Open issue on github
2. Discuss with me
3. Pull Request!

## LICENSE

GNU General Public License v3.0
