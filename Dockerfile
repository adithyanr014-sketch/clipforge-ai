
FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 PORT=10000 CLIPFORGE_HOST=0.0.0.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg unzip fonts-noto-core fonts-noto-extra fonts-noto-malayalam ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ClipForge_AI_Independent_Website.zip /tmp/clipforge-package.zip

RUN unzip -q /tmp/clipforge-package.zip -d /tmp/clipforge-package \
    && cp -a /tmp/clipforge-package/clipforge_core/. /app/ \
    && rm -rf /tmp/clipforge-package /tmp/clipforge-package.zip \
    && mkdir -p /app/data

EXPOSE 10000

CMD ["python", "server.py"]
  
