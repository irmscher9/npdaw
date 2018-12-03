# Use an official Python runtime as a parent image
FROM python:3.6-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt


# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variables
ENV FLASK_APP app
ENV DB_URI postgresql://postgres:123@localhost:5432/npdb1
ENV EMAIL_USER mywebsidekicks@gmail.com
ENV EMAIL_PASSWORD mypass

# Run app.py when the container launches
RUN chmod +x boot.sh
ENTRYPOINT ["./boot.sh"]