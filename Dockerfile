FROM ghcr.io/coqui-ai/tts:latest

EXPOSE 5002

CMD ["tts", "--model_name", "tts_models/en/ljspeech/tacotron2-DDC", "--vocoder_name", "vocoder_models/en/ljspeech/hifigan_v2", "--use_cuda", "false", "--port", "5002"]
