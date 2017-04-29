all: test

venv: Makefile
	rm -rf venv
	virtualenv venv
	venv/bin/pip install pre-commit

.PHONY: test
test: venv
	venv/bin/pre-commit install -f --install-hooks
	venv/bin/pre-commit run --all-files

.PHONY: test-docker_%
test-docker_%:
	docker build -t tox-virtualenv-no-download_$* --build-arg PYTHON=$* .
	docker run --net=none tox-virtualenv-no-download_$*
