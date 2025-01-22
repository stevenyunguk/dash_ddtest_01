FROM python
WORKDIR /app
COPY requirements.txt /app/
COPY python-image/ /app/
RUN pip install -r /app/requirements.txt
CMD ["python", "app.py"]