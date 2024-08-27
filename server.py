from flask import Flask, request, jsonify
import json

app = Flask(__name__)
@app.route('/report', methods=['POST'])
def report():
    try:
        data = request.get_json()

        with open('data_received.json', 'a') as f:
            json.dump(data, f, indent=4)
            f.write("\n")

        return jsonify({"message": "Data received successfully"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
