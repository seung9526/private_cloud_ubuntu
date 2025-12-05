from flask import Flask, jsonify
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/health')
def health():
    return jsonify({"status": "UP"}), 200

@app.route('/')
def index():
    sleep(1)
    return "Service is running!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8088)
