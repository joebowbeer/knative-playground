build:
	ko build main.go -B -v

apply:
	kn service apply signup \
		--image localhost:5001/main.go \
		--port h2c:8080 \
		--cluster-local

port-forward:
	kubectl port-forward -n restate svc/restate 9070:9070 8080:8080

whoami:
	restate whoami

register:
	restate deployments register http://signup.default.svc

clean:
	kind delete cluster -n knative
