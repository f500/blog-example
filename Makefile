SHELL=/bin/bash

.DEFAULT_GOAL := help

PHP_RUN := docker compose run -T --rm php-cli
ARGS ?= $(shell read -p "Additional arguments ([enter] for none): " args; echo $$args)

## build: 	Build the docker containers
.PHONY: build
build:
	docker compose build --pull

## up: 		Runs local environment
.PHONY: up
up:
	docker compose up -d

## destroy: 	Destroys the project
.PHONY: destroy
destroy:
	docker compose down --remove-orphans -v

.PHONY: php
php:
	@${PHP_RUN} $(ARGS)

## composer:      Runs composer through docker
.PHONY: composer
composer:
	@${PHP_RUN} composer $(ARGS) --ansi

## console:	Runs bin/console through docker
.PHONY: console
console:
	@${PHP_RUN} php bin/console $(ARGS) --ansi

## branch:	Checkout trunk, get most recent version, create new branch based on trunk
.PHONY: branch
branch:
	git checkout trunk
	git pull
	@read -p "Enter Branch Name: " branchName; \
    git checkout -b $$branchName

## help:		Print this message
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<
