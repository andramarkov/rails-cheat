# Rails Cheat ![logo](logo.png)

Rails information and cheatsheets.

[Ruby Cheat](https://github.com/cirosantilli/ruby-cheat) contains general Ruby and gem information.

1.  [Ubuntu install](ubuntu-install.md)
1.  [Directory structure](directory-structure.md)
    1. [app/test/unit/main_test.rb](app/test/unit/main_test.rb): everything that can be tested directly by plain stdlib `MiniTest`
    1. [app/controller/controller0_controller.rb](app/controller/controller0_controller.rb): main cheat controller
    1. [test/controllers/controller0_controller_test.rb](test/controllers/controller0_controller_test.rb): controller specific tests that use `ActionController::TestCase` functionality
    1. [app/views/controller0/action0.html.erb](app/views/controller0/action0.html.erb): main cheat view
    1. [app/models/model0.rb](app/models/model0.rb): main cheat model
    1. [test/models/active_record_test.rb](test/models/active_record_test.rb): `ActiveRecord` tests. Those could be done with `unit/main`, but since they are very complex it is better to separate them.
1.  [Rails utility](rails-utility.md)
1.  [Database](database.md)
1.  [Testing](testing.md)
    1. [Spring](spring.md)
    1. [Action mailer testing](action-mailer-testing.md)
1.  [Deployment](deployment.md)
    1. [Assets](assets.md)
1.  [Third party tools](third-party-tools.md)
    1. [RSpec](rspec.md)
    1. [Spinach](spinach.md)
    1. [Capybara](capybara.md)
    1. [factory_girl](factory_girl.md)
    1. [Seed Fu](seed-fu.md)
    1. [Guard](guard.md)
    1. [Foreman](foreman.md)
    1. [Settingslogic](settingslogic.md)
    1. [Lint tools](lint-tools.md)
1. [Internals](internals.md)

## WIP

1.  Testing:
    1. [Shoulda](action-mailer-testing.md)

## Controller

Controllers take user inputs (HTTP requests) and return the expected data page.

Controllers are classes. They live under `app/controller`.

Generate a controller template:

    rails generate controller Controller0

Also generates tests, assets, helpers.

Generate a controller inside a namespace:

    rails generate controller Namespace0::Controller0
    rails generate controller namespace0/controller0

## Action

Actions are controller methods.

Each URL maps to an action which takes care of it.

The view for an action named `action0` (the name of the method) of the controller class named `Controller0` automatically corresponds to the `erb` file `app/views/controller0/action0.html.erb`.

Any instance variable defined in the function as `@var0` becomes available to its corresponding `erb` as `@var0`.

## Helper

Helpers are usually method that output HTML and which are used in views.

They should be defined under `app/helpers`.

## Routes

Determine which action to take for each URL.

Config file: `app/config/routes.rb`

To view all the routes, run:

    rake routes

## Model

See active records.

## Active records

Name for the RoR provided ORM.

A model is a class that will map to a database table. Models inherit from `ActiveRecord::Base`.

Models are defined by:

- `db/schema.rb`: defines the columns and DBMS properties of the database. This file is automatically generated by the migrations, so don't modify it.
- `app/models`: can define properties of models that are not database implemented such as Ruby implemented validation.

Create a new model template:

    rails generate model model_name

or:

    rails generate model ModelName

In both cases above the class will by default be named `ModelName` and the table `model_name`.

This will also create a db migration and test fixtures templates.

Create a template with some fields:

    rails generate model model_name column0:string column1:string

### SQL injection

Website dedicated to SQL injection

<http://rails-sqli.org>

## concerns

Located under `app/models/concerns`.

Files contain modules which extend from `ActiveSupport::Concern`.

Used for code that is strongly coupled to models, but should be shared amongst models.

When to use concerns vs `lib`: <http://stackoverflow.com/questions/16159021/rails-service-objects-vs-lib-classes>

## scaffold

Automatically generates a base CRUD interface for a model.

    rails generate scaffold ModelName
