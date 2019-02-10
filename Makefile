build:
	docker-compose build

clean:
	docker-compose stop
	docker-compose kill
	docker-compose down -v

composer-install:
	cd app && composer install

init: install-laravel build composer-install
	docker-compose up -d app

shell:
	docker-compose run --rm app bash

migrate:
	docker-compose run --rm app php artisan migrate

tests:
	docker-compose run --rm app php vendor/bin/phpunit

install-laravel:
	composer create-project --prefer-dist laravel/laravel app
