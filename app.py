
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
        <head><title>DevOps Pipeline Demo</title></head>
        <body>
            <h1>DevOps Pipeline is Working!</h1>
            <p>Welcome to our end-to-end DevOps experiment.</p>
            <p>Application: Flask</p>
            <p>Deployment: Docker and Kubernetes</p>
        </body>
    </html>
    """

@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "application": "devops-pipeline"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
