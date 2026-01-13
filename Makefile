# Project paths
DOCKER_DIR = src/homeworks/01-docker-terraform
TERRAFORM_DIR = src/homeworks/01-docker-terraform

# Docker image name
IMAGE_NAME = de-zoomcamp-hw01

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  Docker commands:"
	@echo "    make docker-build    - Build Docker image"
	@echo "    make docker-run      - Run Docker container interactively"
	@echo "    make docker-stop     - Stop running container"
	@echo "    make docker-clean    - Remove container and image"
	@echo ""
	@echo "  Terraform commands:"
	@echo "    make tf-init         - Initialize Terraform"
	@echo "    make tf-plan         - Run Terraform plan"
	@echo "    make tf-apply        - Apply Terraform changes"
	@echo "    make tf-destroy      - Destroy Terraform resources"
	@echo "    make tf-fmt          - Format Terraform files"
	@echo "    make tf-validate     - Validate Terraform configuration"

# Docker commands
.PHONY: docker-build
docker-build:
	docker build -t $(IMAGE_NAME) $(DOCKER_DIR)

.PHONY: docker-run
docker-run:
	docker run -it --rm $(IMAGE_NAME)

.PHONY: docker-exec
docker-exec:
	docker exec -it $(IMAGE_NAME) /bin/bash

.PHONY: docker-stop
docker-stop:
	docker stop $(IMAGE_NAME) || true

.PHONY: docker-clean
docker-clean:
	docker rm -f $(IMAGE_NAME) || true
	docker rmi -f $(IMAGE_NAME) || true

# Terraform commands
.PHONY: tf-init
tf-init:
	cd $(TERRAFORM_DIR) && terraform init

.PHONY: tf-plan
tf-plan:
	cd $(TERRAFORM_DIR) && terraform plan

.PHONY: tf-apply
tf-apply:
	cd $(TERRAFORM_DIR) && terraform apply

.PHONY: tf-apply-auto
tf-apply-auto:
	cd $(TERRAFORM_DIR) && terraform apply -auto-approve

.PHONY: tf-destroy
tf-destroy:
	cd $(TERRAFORM_DIR) && terraform destroy

.PHONY: tf-destroy-auto
tf-destroy-auto:
	cd $(TERRAFORM_DIR) && terraform destroy -auto-approve

.PHONY: tf-fmt
tf-fmt:
	cd $(TERRAFORM_DIR) && terraform fmt

.PHONY: tf-validate
tf-validate:
	cd $(TERRAFORM_DIR) && terraform validate

.PHONY: tf-output
tf-output:
	cd $(TERRAFORM_DIR) && terraform output

.PHONY: tf-clean
tf-clean:
	rm -rf $(TERRAFORM_DIR)/.terraform
	rm -f $(TERRAFORM_DIR)/.terraform.lock.hcl
	rm -f $(TERRAFORM_DIR)/terraform.tfstate*
