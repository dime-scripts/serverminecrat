FROM eclipse-temurin:25-jre

# Install Python 3 and necessary tools
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy application files
COPY main.py .
COPY requirements.txt .

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV SERVER_DIR=/data/server

# Create volume for persistent data
VOLUME ["/data"]

# Default command
CMD ["python3", "main.py"]
