from TTS.api import TTS
import sys

text = sys.argv[1]

# Загружаем модель (русская/английская)
tts = TTS(model_name="tts_models/ru/ljspeech/tacotron2-DDC", progress_bar=False, gpu=False)

# Генерация аудио
tts.tts_to_file(text=text, file_path="output.wav")
