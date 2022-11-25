.PHONY: build
build:
	rsync -av public/ dist/
	npx @marp-team/marp-cli README.md -o dist/index.html
	rsync -av assets/ dist/assets/
