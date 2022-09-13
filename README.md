Blog example
=====================

This project has been created as an example for the related blog posts on [https://www.future500.nl](https://www.future500.nl)

## Requirements
This project uses docker and docker compose. For convenience, some make commands were added as well, so make is a requirement as well.

## Get help
Run the `make help` command to see what commands are available

## Build the container(s)
To build the container(s), you can use the convenience method: `make build`

## Start the container(s)
To start the containers, you could run `make up`

## Destroy the container(s)
To destroy the containers, you could run `make destroy`

## Run a console command
You could either use the make command `make console`, which will ask you for the console command as an additional argument, or you could run `dev/console some-console:command`

## Install a composer package
To install composer packages, you can either use `make composer` which will ask you for additional input, or you could run `dev/composer some-command`
