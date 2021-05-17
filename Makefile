.PHONY: local

install:
	gem install bundler
	bundle install

local:
	bundle exec jekyll serve

default: local
