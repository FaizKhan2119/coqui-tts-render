FROM python:3.9-slim

RUN pip install --no-cache-dir TTS

EXPOSE 5002

CMD ["python3", "-m", "TTS.server.server", "--model_name", "tts_models/en/ljspeech/tacotron2-DDC", "--vocoder_name", "vocoder_models/en/ljspeech/hifigan_v2", "--use_cuda", "false", "--host", "0.0.0.0", "--port", "5002"]
