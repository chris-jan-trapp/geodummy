FROM python:3.8

VOLUME /var
RUN mkdir -p /var/storage
ENV DATA_FILE=/var/storage/database.json
ENV HOST_NAME=esx-80.gbv.de

WORKDIR /usr/opt/app
RUN git clone https://github.com/chris-jan-trapp/geodummy.git ./usr/opt/app
RUN pip3 install pipenv
RUN pipenv install --system

WORKDIR /usr/app/src
CMD [ "python3", "./geodummy.py" ]
