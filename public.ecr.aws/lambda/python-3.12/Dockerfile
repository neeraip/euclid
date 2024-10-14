FROM python:3.9

FROM public.ecr.aws/lambda/python:3.12

# Install essential build tools and dependencies
RUN dnf -y update && \
    dnf -y install make tar wget git gcc-c++ cmake3 \
    libcurl-devel libtiff-devel sqlite-devel \
    readline-devel zlib-devel && \
    dnf clean all

# Install PostgreSQL client
RUN wget https://download.postgresql.org/pub/source/v17.0/postgresql-17.0.tar.gz -O /tmp/postgresql.tar.gz && \
    tar -xzf /tmp/postgresql.tar.gz -C /tmp && \
    cd /tmp/postgresql-17.0 && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/postgresql-17.0 /tmp/postgresql.tar.gz

# Install GDAL
RUN wget https://github.com/OSGeo/gdal/releases/download/v3.9.2/gdal-3.9.2.tar.gz -O /tmp/gdal-3.9.2.tar.gz && \
    tar -xvf /tmp/gdal-3.9.2.tar.gz -C /tmp && \
    mkdir /tmp/gdal-3.9.2/build && \
    cd /tmp/gdal-3.9.2/build && \
    cmake .. && \
    cmake --build . && \
    cmake --build . --target install && \
    rm -rf /tmp/gdal-3.9.2 /tmp/gdal-3.9.2.tar.gz

RUN pip install GDAL==3.9.2
RUN pip install geopandas==1.0.1

ENTRYPOINT ["python3"]