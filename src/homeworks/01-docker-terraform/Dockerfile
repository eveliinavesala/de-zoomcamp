FROM python:3.13

WORKDIR /app

COPY . /app

RUN pip install poetry

COPY pyproject.toml poetry.lock /app/

RUN poetry config virtualenvs.create false \
    && poetry install --no-root --no-interaction --no-ansi

CMD ["/bin/bash"]
