
FROM python:3.12-slim


WORKDIR /app

COPY lib/ ./lib/

COPY archViewer.html .

COPY archViewer.js .

COPY viewerProxy.py .


RUN groupadd --system app && useradd --system --gid app --no-create-home app

USER app


ENV LISTENING_PORT=8080

ENV ARCHIVER_DATA_RETRIEVAL_URL=http://localhost:17668/retrieval


CMD ["sh", "-c", "exec python3 viewerProxy.py \"$LISTENING_PORT\" \"$ARCHIVER_DATA_RETRIEVAL_URL\""]
