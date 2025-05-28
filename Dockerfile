FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    build-essential \
    libffi-dev \
    libsndfile1 \
    git \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install Coqui TTS
RUN pip install --no-cache-dir TTS

# Expose server port
EXPOSE 5002

# Run the TTS server
CMD ["python3", "-m", "TTS.server.server", \
    "--model_name", "tts_models/en/ljspeech/tacotron2-DDC", \
    "--vocoder_name", "vocoder_models/en/ljspeech/hifigan_v2", \
    "--use_cuda", "false", \
    "--host", "0.0.0.0", \
    "--port", "5002"]
