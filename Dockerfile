# FROM python:3.9-slim-buster

# WORKDIR /app

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     gcc \
#     g++ \
#     libffi-dev \
#     libssl-dev \
#     libpq-dev \
#     && rm -rf /var/lib/apt/lists/*

# COPY requirements.txt /app/
# COPY python-image/ /app/

# RUN pip install --upgrade pip
# RUN pip install -r /app/requirements.txt

# CMD ["python", "app.py"]
# Use an official Python runtime as a base image
FROM python:3.9-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt /app/

# Copy the entire application code into the container
COPY . /app/

# Upgrade pip and install the Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Define the command to run the application
CMD ["python", "app.py"]