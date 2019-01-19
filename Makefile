
IMAGE = michalhosna/restic-rclone
BASE_TAG = v0.1
RCLONE_VER = "1.45"
RESTIC_VER = "0.9.4"

all: build push

build: Dockerfile
	docker build --build-arg RESTIC_VER=$(RESTIC_VER) --build-arg RCLONE_VER=$(RCLONE_VER) -t $(IMAGE):$(BASE_TAG)-restic$(RESTIC_VER)-rclone$(RCLONE_VER) .

push: build
	docker push $(IMAGE):$(BASE_TAG)-restic$(RESTIC_VER)-rclone$(RCLONE_VER)