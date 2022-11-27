.PHONY: test release clean version

export APP_VERSION ?= $(shell git rev-parse --short HEAD)

version:
	@ echo '{"Version": "$(APP_VERSION)"}'

docker-local:
	docker-compose build --no-cache
	docker-compose up

docker-prod:
	docker-compose -f docker-compose.prod.yml build
	docker-compose up

down:
	docker-compose down -v

clean:
	docker system prune