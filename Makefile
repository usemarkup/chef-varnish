.PHONY: all
default: all;

install:
	gem install bundler

bundle:
	bundle check --path=vendor/bundle || bundle install --path=vendor/bundle --retry=3

berks:
	rm -rf cookbooks/ && bundle exec berks vendor cookbooks

provision:
	vagrant up --provision

kitchen:
	bundle exec kitchen test

style:
	bundle exec cookstyle -D recipes/ attributes/

all: bundle berks provision
