FROM python:3.10-slim

WORKDIR /app

# curl 설치 (healthcheck 때문에 필수)
RUN apt-get update && apt-get install -y curl

COPY app/requirements.txt .
RUN pip install -r requirements.txt

COPY app/ .

EXPOSE 8088

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:8088/health || exit 1

CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8088", "app:app"]
