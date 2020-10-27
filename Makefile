# set default shell
SHELL=/bin/bash -o pipefail -o errexit

TAG ?=v0.1
REGISTRY ?= aledbf

IMAGE = $(REGISTRY)/chrome-aws-lambda-demo

# required to enable buildx
export DOCKER_CLI_EXPERIMENTAL=enabled

# build with buildx
PLATFORMS?=linux/amd64
OUTPUT=
PROGRESS=plain

build-image:
	docker buildx build \
		--platform=${PLATFORMS} $(OUTPUT) \
		--progress=$(PROGRESS) \
		--pull \
		-t $(IMAGE):$(TAG) .

# push the cross built image
push-image: OUTPUT=--push
push-image: build-image
