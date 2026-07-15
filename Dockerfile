
FROM python:3.12-slim


WORKDIR /app

COPY node_modules/ ./node_modules/

COPY archViewer.html .

COPY archViewer.js .

COPY fapaths.json .

COPY viewerProxy.py .


CMD ["python3", "viewerProxy.py", "8080", "http://skybreweru.cslab.esss.lu.se:17668/retrieval"]

