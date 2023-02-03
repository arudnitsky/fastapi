FROM python:3.8-slim-bullseye
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt
RUN mkdir /app
COPY main.py /app
WORKDIR /app

CMD [ "uvicorn", "main:app", "--port", "80", "--host", "0.0.0.0", "--log-level", "debug" ]