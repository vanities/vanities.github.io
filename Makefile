.PHONY: install up

install:
	docker-compose run jekyll bundle install

up:
	docker-compose up jekyll

default: up
