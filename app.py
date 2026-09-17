from flask import Flask

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello_world():
    return 'Hello World'

# Health check endpoint
@app.route('/health', methods=['GET'])
def health_check():
    return 'Health check passed'

if __name__ == '__main__':
    app.run()
