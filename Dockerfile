FROM python:3.8

VOLUME /var
RUN mkdir -p /var/storage
ENV DATA_FILE=/var/storage/database.json
ENV FLASK_APP=geodummy.py
ENV HOST_NAME=esx-80.gbv.de

WORKDIR /usr/src/conf
COPY Pipfile* ./
RUN pip3 install pipenv
RUN pipenv install --system
# RUN ( [ -e "$DATA_FILE" ] || echo '[]' > "$DATA_FILE" )

WORKDIR /usr/src/app
RUN git clone https://github.com/chris-jan-trapp/geodummy.git .
WORKDIR /usr/app/src

CMD [ "python3", "./geodummy.py" ]
