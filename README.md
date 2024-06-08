# README

## Prerequisite

### Ruby installation using RVM or Rbenv

#### RVM installation
`\curl -sSL https://get.rvm.io | bash`

#### Install Ruby version through RVM for Intel computers
`rvm install 3.1.4`

#### Install Ruby version through RVM for silicon chip Mac

```
brew uninstall --ignore-dependencies openssl@3
brew reinstall openssl@1.1
rvm install 3.1.4

OR

rvm install ruby-3.1.4 --with-openssl-dir=/opt/homebrew/opt/openssl@1.1
```

#### Use Ruby version
`rvm use 3.1.4`

#### Install Ruby with rbenv

```
brew install rbenv
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.zshrc 
rbenv install 3.1.4
rbenv global 3.1.4
rbenv rehash
```

### Setup postgres
`brew install postgresql@14`

### Start PostgreSQL
`brew services start postgresql@14`


## Setup the project

`gem install bundler`

> For MacOS (likely M-chip), in case you run into an issue related to `NSCFConstantString`, run commands:

```sh
spring stop
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
```

[See Reference - NSCFConstantString](https://www.jdeen.com/blog/fix-ruby-macos-nscfconstantstring-initialize-error)


### Rails installation
`bundle install`

### Setup project database
`rails db:setup`

### Run rails migration to create the db tables
`rails db:migrate`

### Run rails seed
`rails db:seed`

### Start the Rails server
`rails s`

### appsignal setup

  replace APPSIGNAL_PUSH_API_KEY in appsignal.yml with your key from appsignal

  push_api_key: "<%= ENV['APPSIGNAL_PUSH_API_KEY'] %>"
