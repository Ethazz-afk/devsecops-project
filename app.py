from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World'

@app.route('/health')
def health_check():
    return 'Health check passed'

if __name__ == '__main__':
    app.run()
