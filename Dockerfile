# Dockerfile
FROM python:3.10

RUN apt-get update && \
    apt-get install -y docker.io && \
    pip install --upgrade pip

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /app

CMD ["python", "app.py"]
