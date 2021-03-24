from flask import Flask, request, render_template
from os import environ
import json


DATA_FILE = environ.get('DATA_FILE', 'tst.json')
HOST_NAME = environ.get('HOST_NAME', 'local')
app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html', HOST_NAME=HOST_NAME)


@app.route('/features/', methods=['GET', 'POST'])
def features(*args, **kwargs):
    if request.method == 'POST':
        data = request.get_json()
        features = data['features']
        with open(DATA_FILE, 'r') as data_file:
            existing = json.load(data_file)
        existing["features"] += features
        with open(DATA_FILE, 'w') as data_file:
            json.dump(existing, data_file)
        return f"Added {len(features)} feature(s)."

    if request.method == 'GET':
        with open(DATA_FILE, 'r') as data_file:
            features = json.load(data_file)
        return features


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')