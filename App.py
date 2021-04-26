from flask import Flask, request
from flask_restful import Resource, Api
import Core_logic, json

app = Flask(__name__)
api = Api(app)

#@app.route('/', methods=['GET'])
@app.route('/')
def pull_jokes():
    return Core_logic.get_jokes()
