FROM python:3.9-slim-buster

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
COPY python-image/ /app/

RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

CMD ["python", "app.py"]