# run:
# 	docker run --interactive --tty --publish 9080 localhost:5001/greeter

build:
	pack build localhost:5001/greeter \
		--buildpack docker.io/paketobuildpacks/nodejs \
		--builder docker.io/paketobuildpacks/builder-jammy-buildpackless-base \
		--verbose
	docker push localhost:5001/greeter

# FIXME: https://github.com/buildpacks/lifecycle/issues/1578
build-failure:
	pack build localhost:5001/greeter \
		--buildpack docker.io/paketobuildpacks/nodejs \
		--builder docker.io/paketobuildpacks/builder-jammy-buildpackless-base \
		--publish --verbose

# 		--tag localhost:5001/greeter \
# 		--insecure-registry localhost:5001 \

apply:
	kn service apply greeter \
		--image localhost:5001/greeter \
		--port h2c:9080 \
		--cluster-local

# TODO: https://docs.restate.dev/services/deploy/kubernetes#knative-deployment
# The service will be accessible at http://greater.default but to handle versioning,
# it is preferable to register the new revision url like http://greeter-0001.default
# as part of your deployment workflow. 
register:
	restate deployments register http://greeter.default.svc
