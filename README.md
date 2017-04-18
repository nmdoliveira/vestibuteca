# Vestibuteca

[![CircleCI](https://circleci.com/gh/play-it/vestibuteca.svg?style=svg)](https://circleci.com/gh/play-it/vestibuteca)

Vestibuteca is a collection of questions from college entrance exams. Currently supported exams are:
* ENEM

## Contribuiting to the project

To contribuite to the Vestibuteca project, simple fork it and open a new pull request with your fixes.

## Development installation

The following steps are not required to be made for contribute to the project, although it will ensure that your solution environment is compatible with our test/production environment.

### 1. Setup the development environment (virtual machine)

  1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
  3. Install [ChefDK](https://downloads.chef.io/chef-dk/)
  4. Install [vagrant-omnibus](https://github.com/chef/vagrant-omnibus):

  ```
  $ vagrant plugin install vagrant-omnibus
  ```

  5. Install the nfs server:

  ```
  $ sudo apt-get install nfs-kernel-server
  ```

  6. Clone the project with `git clone`
  7. `cd` into the project folder and run:

  ```
  $ berks vendor cookbooks
  ```

  8. Bring the VM up (it's gonna take a while):

  ```
  $ vagrant up
  ```

Virtual machine should be up and running.

Open a SSH connection with the virtual machine by running:

    $ vagrant ssh

### 2. Bundle

In the virtual machine, run:

    $ bundle install


### 3. Environment setup

In the virtual machine run:

    $ cp .env.example .env.development
    $ cp .env.example .env.test

Next, generate two random secrets to use on session store:

    $ ruby -rsecurerandom -e "puts SecureRandom.hex(64)"

Replace the `secret` value on the `WEB_SESSIONS_SECRET` variable in the `.env` files with the value returned by the last command.

### 4. Database setup

In the virtual machine, run:

    $ bundle exec hanami db prepare
    $ HANAMI_ENV=test bundle exec hanami db prepare

### 5. Run the tests

Run the tests to check if everything is working:

    $ bundle exec rspec

### 6. Run the server

Run:

    bundle exec hanami server --host=0.0.0.0 --port=3000

to start the server.

Check that it is working by opening a browser in the host machine and pointing it to [http://localhost:3000].

[http://localhost:3000]: http://localhost:3000
