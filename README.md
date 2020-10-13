# README

## Setup

Run the following series of commands:

```docker-compose up --build -d```

```docker-compose run web bundle exec rake db:create db:migrate db:seed```

The app can be accessed at `localhost:3000`. Default login is `default@acme.com` and `password`.
