docs:
	elm make --docs=docs.json

build:
	WATCHING=false elm-auto-encoder-decoder src/Protocol.elm
	egrep -v '^function clientContent|return dict\[key\]' bin/elm-webapp | pbcopy
	(pbpaste; \
	 printf "function clientContent(key) { const dict = "; \
	 ./bin/generate-client-content; \
	 printf "; return dict[key] }\n") > bin/elm-webapp
