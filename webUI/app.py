from flask import Flask, jsonify, render_template
import json

LOG_FILE = "/var/log/ssh_bruteforce.log"

app = Flask(__name__)

def read_logs(limit=100):
    logs = []
    try:
        with open(LOG_FILE) as f:
            for line in f.readlines()[-limit:]:
                try:
                    logs.append(json.loads(line.strip()))
                except json.JSONDecodeError:
                    continue
    except FileNotFoundError:
        pass
    return logs

@app.route("/api/logs")
def api_logs():
    return jsonify(read_logs())

@app.route("/")
def index():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
