all: run

build:
	@docker build -t colm-dev -f colm-dev.Dockerfile .

run:
	if [ ! "${WORKSPACE}" ]; then \
		echo "usage: WORKSPACE=path/to/workspace make run"; \
		exit 1; \
	fi

	@if ! docker ps --format '{{.Names}}' | grep -q '^colm-dev$$'; then \
		echo "starting the colm-dev container"; \
		docker run -d -it -v ~/.ssh:/home/vscode/.ssh:ro \
		-v ~/persona:/workspaces/persona \
		-v ~/persona:/workspace \
		-v /etc/gitconfig:/etc/gitconfig \
		-v ~/go/bin:/home/vscode/go/bin:ro \
		--network host \
		--cap-add SYS_PTRACE \
		-w /workspace -u 1000:1000 --name colm-dev colm-dev bash; \
		echo "colm-dev container started"; \
	fi
	@docker exec -it colm-dev bash; \

clean:
	@docker kill colm-dev || true
	@docker rm colm-dev || true
