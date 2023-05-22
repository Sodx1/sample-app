FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    --no-install-recommends gcc \
    python3.9-dev \
    libpq-dev

WORKDIR /opt/app
COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

COPY entrypoint.sh entrypoint.sh
RUN chmod u+x entrypoint.sh

COPY sampleapp sampleapp
COPY sampleproject sampleproject
COPY manage.py manage.py

ENTRYPOINT [ "./entrypoint.sh" ]