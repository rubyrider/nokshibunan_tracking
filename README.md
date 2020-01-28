# Nokshibunan Tracking

[nokshibunan.com](https://nokshibunan.com)

## Install

### Clone the repository

```shell
git clone git@github.com:rubyrider/nokshibunan_tracking.git
cd nokshibunan_tracking
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (or rvm, whatever you prefer):

```shell
rbenv install 2.5.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set environment variables

Using rails credentials.yml.enc and master.key[(blog for details)](https://blog.eq8.eu/til/rails-52-credentials-tricks.html). Paste the below to the `credentials.yml.enc`

```
database:
  username:
    development: 'your-username'
    production: 'your-username'
  password:
    development: 'your-password'
    production: 'your-password'
  name:
    production: 'prod-db-name'
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```

## Deploy

### Coming soon..