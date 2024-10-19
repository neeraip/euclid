# Geospatial Docker Image

A Docker base image for geospatial applications, built on top of AWS Lambda's Python 3.12 runtime and a standard Python 3.12 runtime. This image includes essential geospatial libraries and tools, such as PROJ and GDAL.

## Table of Contents

- Features
- Getting Started
- Prerequisites
- Building the Images
- Usage
- License

## Features

- Base image based on AWS Lambda's Python 3.12 or standard Python 3.12.
- Includes geospatial libraries: PROJ and GDAL.
- Multi-platform support for linux/amd64 and linux/arm64.

## Getting Started

Follow these steps to set up the project and build the Docker images.

### Prerequisites

- Docker (version 19.03 or higher)
- Docker BuildKit enabled

To check your Docker version, run:

```bash
docker --version
```

### Enabling Docker BuildKit

Enable Docker BuildKit by adding the following to your Docker configuration file (usually located at ~/.docker/config.json):

```json
{
  "features": {
    "buildkit": true
  }
}
```

### Installing Docker Buildx

If buildx is not included in your Docker installation, you can install it using:

```bash
docker buildx install
```

### Creating a Buildx Builder

Create a new builder instance:

```bash
docker buildx create --use --platform=linux/arm64,linux/amd64 --name multi-platform-builder
```

Check available platforms:

```bash
docker buildx inspect --bootstrap
```

## Building the Images

To build the multi-platform Docker images, run the following command:

```bash
docker compose build
```

This Docker compose file will build both images with the specified tags for linux/amd64 and linux/arm64.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
