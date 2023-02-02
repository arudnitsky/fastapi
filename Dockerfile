# Using lightweight alpine image
FROM python:3.8-alpine

# Installing packages
RUN apk update
RUN pip install --no-cache-dir pipenv

# Defining working directory and adding source code
WORKDIR /Users/andy/Projects/ukrainian/ukr-nlp-api/service  ?
COPY Pipfile Pipfile.lock run-service.sh ./ ?
COPY service ./service ?

# Install API dependencies
RUN pipenv install --system --deploy ?

# Start app
EXPOSE 5000
ENTRYPOINT ["/Users/andy/Projects/ukrainian/ukr-nlp-api/service/run-service.sh"]