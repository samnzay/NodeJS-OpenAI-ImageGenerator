.PHONY: help


help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

app-build: ## Build Docker image generator
	docker build --tag ai-nodejs-image-gen:v1.0.0 .

app-run: ## Run AI image generator appin Docker
	docker run -p 5000:5000 --name AI-Image-Generator ai-nodejs-image-gen:v1.0.0 

app-logs: ## Print all logs for QUEUE Container
	docker logs ai-nodejs-image-gen:v1.0.0