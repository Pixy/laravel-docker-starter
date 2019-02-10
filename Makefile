build:
	docker-compose build

clean:
	docker-compose stop
	docker-compose kill
	docker-compose down -v

composer-install:
	cd app && composer install

start: 
	docker-compose up -d app

shell:
	docker-compose run --rm app bash

migrate:
	docker-compose run --rm app php artisan migrate

tests:
	docker-compose run --rm app php vendor/bin/phpunit

install-laravel:
	composer create-project --prefer-dist laravel/laravel app

clean-git:
	rm -rf .git
	git init

init: install-laravel build clean-git start