.PHONY: all
default: all;

install:
	gem install bundler

bundle:
	bundle check --path=vendor/bundle || bundle install --path=vendor/bundle --retry=3

berks:
	rm -rf cookbooks/ && bundle exec berks vendor cookbooks

vagrant:
	vagrant up --provision

kitchen:
	bundle exec kitchen test

style:
	bundle exec cookstyle -D

all: bundle berks vagrant
