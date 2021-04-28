
POETRY_VERSION=1.1.6

POETRY=curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - --version ${POETRY_VERSION}


install: ## install tools and package
	@${POETRY} && \
	export PATH="${PATH}":"${HOME}/.poetry/bin" && \
	poetry config virtualenvs.create true && \
	poetry install 


develop_for_docker: ## install tools and package for buit-in
	@${POETRY} && \
	export PATH="${PATH}":"${HOME}/.poetry/bin" && \
	poetry config virtualenvs.create false && \
	poetry install --no-root
