from flask import Flask, request, send_file
from TTS.api import TTS

app = Flask(__name__)
tts = TTS(model_name="tts_models/multilingual/multi-dataset/your_tts", progress_bar=False, gpu=False)

@app.route("/tts", methods=["POST"])
def tts_generate():
    text = request.json.get("text", "")
    if not text:
        return {"error": "No text provided"}, 400

    output_path = "output.wav"
    tts.tts_to_file(text=text, file_path=output_path)
    return send_file(output_path, mimetype="audio/wav")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
