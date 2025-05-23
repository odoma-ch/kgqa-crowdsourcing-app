FROM python:3.12-slim

WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY main.py .
COPY database.py .
COPY helper_methods.py .
COPY templates/ ./templates/
COPY __init__.py .
COPY .env .

# Expose the port the app runs on
EXPOSE 8002

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8002"]
