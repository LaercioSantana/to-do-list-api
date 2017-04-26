# To-do list

**Environment**
  
 * Ruby 2.4.0
 * Rails 5.0.2

### Usage

On the root folder:

```console

$ bundle install     # install dependencies
$ rake db:create     # create database
$ rake db:migrate    # update database schema
$ rails s            # run server

```

## Run tests

On the root folder:

```console
$ rspec spec --format documentation
```

## Doc

You can see the documentation [here](https://laerciosantana.github.io/to-do-list-api/doc/)

To generate the documentation you need have installed [apidoc](http://apidocjs.com).

```console
$ apidoc -i app/controllers/ -o doc/
``` 


