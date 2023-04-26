from flask import Flask, jsonify, send_from_directory
import os
app = Flask(__name__,  static_folder="static")


# Add this route to serve the React app
@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def serve(path):
    if path != "" and os.path.exists(app.static_folder + path):
        return send_from_directory(app.static_folder, path)
    else:
        return send_from_directory(app.static_folder, "index.html")


@app.route('/api/hello')
def hello_world():
    return jsonify(message='Hello, World!!!')


if __name__ == '__main__':
    app.run(debug=True)
