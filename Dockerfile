FROM python:3.9-slim as base
FROM base as builder
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --user -r /requirements.txt

FROM base
# copy only the dependencies installation from the 1st stage image
COPY --from=builder /root/.local /root/.local
RUN mkdir /app
COPY main.py /app
WORKDIR /app

# update PATH environment variable
ENV PATH=/home/app/.local/bin:$PATH

CMD [ "uvicorn", "main:app", "--port", "80", "--host", "0.0.0.0", "--log-level", "debug" ]