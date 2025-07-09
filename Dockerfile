# Use Python 3.10 as the base image
FROM python:3.10

# Update and install necessary packages (optional, docker.io not needed here unless you have a specific reason)
RUN apt-get update && apt-get install -y \
    && pip install --upgrade pip

# Set working directory inside container
WORKDIR /app

# Copy only requirements first for better layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose port Flask will listen on
EXPOSE 5000

# Run Flask app
CMD ["python", "app.py"]
