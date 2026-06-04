# Use a stable, reliable version of Python
FROM python:3.9-buster

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the PyGoat code
COPY . /app/

# Run the PyGoat server
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
