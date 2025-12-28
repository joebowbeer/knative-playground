build:
	KO_DOCKER_REPO=localhost:5001 ko build main.go -B

create:
	kn service create example \
		--image localhost:5001/main.go \
		--port h2c:8080
