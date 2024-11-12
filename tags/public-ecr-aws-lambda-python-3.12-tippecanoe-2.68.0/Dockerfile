FROM public.ecr.aws/lambda/python:3.12

# Install essential build tools and dependencies
RUN dnf -y update && \
    dnf -y install make tar wget git gcc-c++ cmake3 \
    libcurl-devel libtiff-devel readline-devel \
    zlib-devel sqlite-devel postgresql-devel && \
    dnf clean all

# Install tippecanoe from source
RUN git clone https://github.com/felt/tippecanoe.git --depth=1 --branch=main --single-branch /tmp/tippecanoe && \
    cd /tmp/tippecanoe && \
    make -j && \
    make install && \
    cp /tmp/tippecanoe/tippecanoe /usr/bin/tippecanoe && \
    cp /tmp/tippecanoe/tile-join /usr/bin/tile-join && \
    rm -rf /tmp/tippecanoe