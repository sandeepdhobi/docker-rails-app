# Friends List App

## commmand to run to run this project

```
  commands to run : docker-compose build, docker-compose run web yarn install, docker-compose up ==> to run the project ( check also comments of docker-compose.yml )


  795  cd Projects/Practice/docker_rails_app
  796  ls
  797  cd railsfriends
  802  docker-compose build
  803  docker-compose run web bundle install
  804  docker compose up
  805  docker-compose run web bundle install yarn install
  807  docker compose up
  813  docker container ls 
  814  docker container ls -a
  815  docker image prune
  816  docker image ls 
  817  docker compose stop
  818  docker compose down
```

## Helpful command of rails
- `bundle exec rails g scaffold relatives name:string relation:string => rails db:migrate`
- `rails g migration add_user_id_to_relatives user_id:integer:index => rails db:migrate`
- `rails c`



