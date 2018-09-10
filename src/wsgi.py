from flask import Flask, request, jsonify


app = Flask(__name__)


@app.route('/')
def hello_world():
    return """
        Simple response from Flask running inside uWSGI, 
        which is running within nGINX, 
        which is hosted inside a Docker image!
    """


@app.route('/echo_request')
def echo_request():
    username = request.headers.get('Auth-User')
    return jsonify(dict(request.headers))


if __name__ == '__main__':
    app.run(
        debug=True,
        host='0.0.0.0',
        port=8080
    )