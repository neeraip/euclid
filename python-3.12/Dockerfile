# Use Python 3.12 as the base image
FROM python:3.12

WORKDIR /app

# Install essential build tools and dependencies, including PROJ and GDAL
RUN apt-get update && \
    apt-get install -y build-essential wget git cmake \
    libcurl4-openssl-dev libtiff-dev libreadline-dev zlib1g-dev \
    libsqlite3-dev libpq-dev proj libproj-dev gdal-bin libgdal-dev && \
    apt-get clean

# Install Python GDAL package
RUN pip install GDAL==3.8.0

ENTRYPOINT ["python3"]
