FROM python:3

RUN apk update

ADD requirements.txt /
RUN pip3 install -r requirements.txt
ADD main.py /
ADD start-server.sh /

EXPOSE 5000
CMD [ "./start-server.sh"]
