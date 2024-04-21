# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.12-slim AS development_build

EXPOSE 8000
RUN apt-get -y update; apt-get -y install curl
# Keeps Python from generating .pyc files in the container
ENV YOUR_ENV="development" \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
# Poetry's configuration:
    POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR='/var/cache/pypoetry' \
    POETRY_HOME='/usr/local' \
    POETRY_VERSION=1.7.1 

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install non-python dependent poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN poetry --version


WORKDIR /app
COPY poetry.lock pyproject.toml /app/

# Project initialization:
RUN poetry install $(test "$YOUR_ENV" == production && echo "--only=main") --no-interaction --no-ansi

# Creating folders, and files for a project:
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# File wsgi.py was not found. Please enter the Python path to wsgi file.
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "/app/application/wsgi.py:app"]
