from flask import Flask, jsonify, request
import json

#declared an empty variable for reassignment
response = ''

#creating the instance of our flask application
app = Flask(__name__)

#route to entertain our post and get request from flutter app
@app.route('/api', methods = ['GET', 'POST'])


def nameRoute():

   d={}
   inputchar=str(request.args['query'])
   answer = str(request.args['query'])
   d['Output']=answer
   return d

    #checking the request type we get from the app
    


if __name__ == "__main__":
    app.run(debug=True)
