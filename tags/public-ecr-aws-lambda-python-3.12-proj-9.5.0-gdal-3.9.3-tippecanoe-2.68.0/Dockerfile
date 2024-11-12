FROM public.ecr.aws/lambda/python:3.12

# Install essential build tools and dependencies
RUN dnf -y update && \
    dnf -y install make tar wget git gcc-c++ cmake3 \
    libcurl-devel libtiff-devel readline-devel \
    zlib-devel sqlite-devel postgresql-devel && \
    dnf clean all

# Install PROJ from source
RUN wget https://download.osgeo.org/proj/proj-9.5.0.tar.gz -O /tmp/proj-9.5.0.tar.gz && \
    tar -xvf /tmp/proj-9.5.0.tar.gz -C /tmp && \
    mkdir /tmp/proj-9.5.0/build && \
    cd /tmp/proj-9.5.0/build && \
    cmake .. && \
    cmake --build . && \
    cmake --build . --target install && \
    rm -rf /tmp/proj-9.5.0 /tmp/proj-9.5.0.tar.gz

# Install GDAL from source
RUN wget https://github.com/OSGeo/gdal/releases/download/v3.9.3/gdal-3.9.3.tar.gz -O /tmp/gdal-3.9.3.tar.gz && \
    tar -xvf /tmp/gdal-3.9.3.tar.gz -C /tmp && \
    mkdir /tmp/gdal-3.9.3/build && \
    cd /tmp/gdal-3.9.3/build && \
    cmake .. && \
    cmake --build . && \
    cmake --build . --target install && \
    rm -rf /tmp/gdal-3.9.3 /tmp/gdal-3.9.3.tar.gz

# Install Python GDAL package
RUN pip install GDAL==3.9.3

# Install tippecanoe from source
RUN git clone https://github.com/felt/tippecanoe.git --depth=1 --branch=2.68.0 --single-branch /tmp/tippecanoe && \
    cd /tmp/tippecanoe && \
    make -j && \
    make install && \
    cp /tmp/tippecanoe/tippecanoe /usr/bin/tippecanoe && \
    cp /tmp/tippecanoe/tile-join /usr/bin/tile-join && \
    rm -rf /tmp/tippecanoe