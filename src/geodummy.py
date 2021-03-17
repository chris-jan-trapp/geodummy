from flask import Flask, request
from os import environ
import requests
import json


DATA_FILE = environ.get('DATA_FILE', 'tst.json')
app = Flask(__name__)


@app.route('/')
def hello_world():
    return f'Pseudo geo server'


@app.route('/features/', methods=['GET', 'POST'])
def features(*args, **kwargs):
    if request.method == 'POST':
        with open(DATA_FILE, 'r') as data_file:
            existing = json.load(data_file)
        existing["features"].append()
        with open(DATA_FILE, 'w') as data_file:
            existing = json.dump(existing, data_file)

    if request.method == 'GET':
        with open(DATA_FILE, 'r') as data_file:
            features = json.load(data_file)
        return features


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')