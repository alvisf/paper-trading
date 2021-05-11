FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get -y install python3.7
RUN apt-get -y install python3-pip

WORKDIR /app

COPY . /app

RUN pip3 --no-cache install yfinance \ 
    && pip3 --no-cache-dir install -r requirements.txt

EXPOSE 3009

ENTRYPOINT ["python3"]
CMD ["app.py"]