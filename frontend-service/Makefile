SHELL := /bin/bash

run:
	go run ./cmd/frontend/main.go

# Modules support

reset:
	git checkout -- go.mod
	go mod tidy
	go mod vendor

tidy:
	go mod tidy
	go mod vendor

upgrade:
	# go get $(go list -f '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}' -m all)
	go get -u -t -d -v ./...
	go mod tidy
	go mod vendor

cleancache:
	go clean -modcache

list:
	go list -mod=mod all

