# yibu.io

[yibu.io](https://yibu.io) community source

异步IO 是基于评分和标签的论坛，灵感来自于 Reddit, 可以认为是精简的开源实现

# SETUP

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

# LICENSE

GNU General Public License v3.0
