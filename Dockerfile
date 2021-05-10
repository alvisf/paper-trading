FROM alpine:latest

RUN apk add --no-cache python3-dev \
    && apk add --no-cache py-pip

WORKDIR /app

COPY . /app

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update --no-cache py3-numpy py3-pandas@testing

RUN pip3 --no-cache install yfinance \ 
    && pip3 --no-cache-dir install -r requirements.txt


EXPOSE 3009

ENTRYPOINT ["python3"]
CMD ["app.py"]