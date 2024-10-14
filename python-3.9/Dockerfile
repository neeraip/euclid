FROM python:3.9

RUN apt-get update
RUN apt-get install -y libgdal-dev

RUN pip install GDAL==3.2.2.1
RUN pip install geopandas==0.14.0

ENTRYPOINT ["python3"]
