.PHONY: help


AI-IMAGE-GEN-CONTAINER=AI-Image-Generator
help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

app-build: ## Build Docker image generator
	docker build --tag ai-nodejs-image-gen:v1.0.0 .

app-run: ## Run AI image generator appin Docker
	docker run -p 5000:5000 --name ${AI-IMAGE-GEN-CONTAINER} ai-nodejs-image-gen:v1.0.0 

app-stop: ## Stop IMAGE GENERATOR Container
	docker stop ${AI-IMAGE-GEN-CONTAINER}
	docker rm ${AI-IMAGE-GEN-CONTAINER}

app-start: ## Start IMAGE GENERATOR Container
	@docker stop ${AI-IMAGE-GEN-CONTAINER}
	docker start ${AI-IMAGE-GEN-CONTAINER}

app-logs: ## Print all logs for IMAGE GENERATOR Container
	docker logs ${AI-IMAGE-GEN-CONTAINER}