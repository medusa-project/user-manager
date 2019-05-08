The User Manager is a Rails application that manages user authorization for
the Medusa ecosystem.

# Requirements

* PostgreSQL 9.x

# Development

## Prepare a development environment

```
# Install RVM
$ \curl -sSL https://get.rvm.io | bash -s stable
$ source ~/.bash_profile

# Clone the repository
$ git clone https://github.com/medusa-project/user-manager.git
$ cd user-manager

# Install Ruby into RVM
$ rvm install "$(< .ruby-version)" --autolibs=0

# Install Bundler
$ gem install bundler

# Install the gems needed by the application
$ bundle install

# Configure the application
# After acquiring config/master.key from someone on the project team:
$ bin/rails credentials:edit

# Create and seed the database
$ bin/rails db:setup

# Add a user
$ bin/rails users:create <username>

# Start the server
$ bin/rails server
```

## Sign in

Navigate to `/signin` and log in as the user you created, using any email
address as a password.

# Production

The following environment variables must be passed into the container:

* `SHIBBOLETH_HOST`
