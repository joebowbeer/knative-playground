port-forward:
	kubectl port-forward -n restate svc/restate 9070:9070 8080:8080

whoami:
	restate whoami

clean:
	kind delete cluster -n knative
