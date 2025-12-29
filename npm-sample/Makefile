run:
	docker run --interactive --tty --publish 8080 localhost:5001/npm-sample

build:
	pack build localhost:5001/npm-sample \
		--buildpack docker.io/paketobuildpacks/nodejs \
		--builder docker.io/paketobuildpacks/builder-jammy-buildpackless-base \
		--verbose
	docker push localhost:5001/npm-sample

# FIXME: https://github.com/buildpacks/lifecycle/issues/1578
build-failure:
	pack build localhost:5001/npm-sample \
		--buildpack docker.io/paketobuildpacks/nodejs \
		--builder docker.io/paketobuildpacks/builder-jammy-buildpackless-base \
		--publish --verbose

# 		--tag localhost:5001/npm-sample \
# 		--insecure-registry localhost:5001 \

apply:
	kn service apply npm-sample \
		--image localhost:5001/npm-sample \
		--port h2c:8080 \
		--cluster-local
