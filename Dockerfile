FROM node:20-slim AS deps

WORKDIR /build

COPY package.json package-lock.json ./
RUN npm ci


FROM python:3.12-slim

WORKDIR /app

COPY --from=deps /build/node_modules/ ./node_modules/

COPY css/ ./css/

COPY archViewer.html .

COPY archViewer.js .

COPY fapaths.json .

COPY icons/ ./icons/

COPY viewerProxy.py .


RUN groupadd --system app && useradd --system --gid app --no-create-home app

USER app


ENV LISTENING_PORT=8080

ENV ARCHIVER_DATA_RETRIEVAL_URL=http://localhost:17668/retrieval


CMD ["sh", "-c", "exec python3 viewerProxy.py \"$LISTENING_PORT\" \"$ARCHIVER_DATA_RETRIEVAL_URL\""]
