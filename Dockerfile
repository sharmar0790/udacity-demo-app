FROM python:3.10-slim-buster

USER root

WORKDIR /app

COPY ./requirements.txt requirements.txt

RUN ls -al
# Dependencies required for psycopg2 (used for Postgres client)
RUN apt update -y && apt install -y build-essential libpq-dev && pip install -r requirements.txt

COPY . .

CMD ["python", "./app.py"]
