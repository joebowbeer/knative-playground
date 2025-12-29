# knative-playground

Open this repo in a Codespace.

Commands to try:

```bash
kn version
kn quickstart version
func version
pack version
restate whoami
```

Build and run a sample:

```bash
cd greeter
make build
make apply
make register
```

In the Devcontainer Ports tab, click on port 9070 and open in a browser to view the Restate UI.

Send some greetings:

```bash
curl localhost:8080/greeter/mary/greet -H 'content-type: application/json' -d '{ "greeting" : "Hi" }'
curl localhost:8080/greeter/barack/greet -H 'content-type: application/json' -d '{"greeting" : "Hello" }'
curl -X POST localhost:8080/greeter/mary/ungreet
```

Output:

```
"Hi mary for the 1-th time."
"Hello barack for the 1-th time."
"Dear mary, taking one greeting back: 0."
```
