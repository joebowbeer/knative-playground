build:
	ko build main.go -B -v

apply:
	kn service apply signup \
		--image localhost:5001/main.go \
		--port h2c:8080 \
		--cluster-local

register:
	restate deployments register http://signup.default.svc
