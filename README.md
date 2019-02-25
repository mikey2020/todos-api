# README

[![Build Status](https://travis-ci.org/mikey2020/todos-api.svg?branch=develop)](https://travis-ci.org/mikey2020/todos-api)

## Ruby version
 - Ruby 2.4.1

## System dependencies(Gems)
 * [Ruby:](https://www.ruby-lang.org/en/) Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.
 * [Rails:](https://rubyonrails.org//)
 * [Dotenv:](https://github.com/bkeepers/dotenv) Shim to load environment variables from .env into ENV in development.
 * [Pg:](https://rubygems.org/gems/pg/versions/0.18.4) Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]
 
## Installation or Configuration
- Clone this repository to have the app on your machine with ```git clone https://github.com/mikey2020/todos-api.git```
- Change directory to the app's root with ```cd todos-api```
- Pull the development branch with ```git pull origin develop```
- Then run ```bundle install```  to install the dependencies.
- Copy contents of ```.env-sample``` to your local ```.env```.
- Run ```rails db:migrate``` to migrate database tables.
- Start the server with ```rails s```
- Then visit ```http://localhost:3000``` to view the app.

## User features
- You can create a todo.
- You can add an item to a todo.
- You can delete a todo.
- You can delete an item.

## How to Contribute
- Fork this repository.
- Clone it.
- Create your feature branch on your local machine with ```git checkout -b your-feature-branch```
- Push your changes to your remote branch with ```git push origin your-feature-branch```
- Open a pull request to the master branch, and describe how your feature works

### Author
Michael Eboagu