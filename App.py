from flask import Flask, request
from flask_restful import Resource, Api
from Core_logic import Core_logic
import json

app = Flask(__name__)
coreLogic = Core_logic();

#@app.route('/', methods=['GET'])
@app.route('/')
def pull_jokes():
    return coreLogic.get_jokes()