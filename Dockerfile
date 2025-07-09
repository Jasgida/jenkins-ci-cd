# Dockerfile
FROM python:3.10

# Set work directory
WORKDIR /app

# Copy everything into the container's /app directory
COPY . /app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
