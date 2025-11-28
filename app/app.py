from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/health')
def health():
    return jsonify({"status": "UP"}), 200

@app.route('/')
def index():
    return "Service is running!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8088)
