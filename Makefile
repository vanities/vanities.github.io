.PHONY: install up

install:
	docker-compose run jekyll bundle install

up:
	docker-compose up jekyll

down:
	docker-compose down

default: up
