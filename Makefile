.PHONY: install up

install:
	docker-compose run jekyll bundle install  --remove-orphans

up:
	docker-compose up jekyll

down:
	docker-compose down

default: up
