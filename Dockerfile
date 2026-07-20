
FROM python:3.12-slim


WORKDIR /app

COPY node_modules/ ./node_modules/

COPY css/ ./css/

COPY archViewer.html .

COPY archViewer.js .

COPY fapaths.json .

COPY viewerProxy.py .


ENV LISTEN_PORT=8080

ENV HOST_NAME=http://remote-archiver-appliance.ess.eu:17668/retrieval/


CMD ["python3", "viewerProxy.py", "$LISTEN_PORT", "$HOST_NAME"]

