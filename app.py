from flask import Flask

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello_world():
    return 'Hello World'

@app.route('/health', methods=['GET'])
def health_check():
    return 'Health check passed'

if __name__ == '__main__':
    app.run()
