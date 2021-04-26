from flask import Flask, request
from flask_restful import Resource, Api
from flask.ext.jsonpify import jsonify

app = Flask(__name__)
api = Api(app)

class AppCore(Resource):
    def get(self):
        return {'employees': [i[0] for i in query.cursor.fetchall()]} # Fetches first column that is Employee ID

        

api.add_resource(Employees, '/employees') # Route_1
api.add_resource(Tracks, '/tracks') # Route_2
api.add_resource(Employees_Name, '/employees/<employee_id>') # Route_3


if __name__ == '__main__':
     app.run(port='5002')
     