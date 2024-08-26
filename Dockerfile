FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
                       wget \
                       gnupg \
                       curl \
                       unzip \
                       libxss1 \
                       fonts-liberation \
                       libappindicator3.1 \
                       libindicator7 \
                       xdg-utils \
                       lsb-release

ENV CHROME_VERSION=128.0.6613.84
ENV CHROME_URL=https://storage.googleapis.com/chrome-for-testing-public/$CHROME_VERSION/linux64/chrome-linux64.zip
ENV CHROMEDRIVER_URL=https://storage.googleapis.com/chrome-for-testing-public/$CHROME_VERSION/linux64/chromedriver-linux64.zip

RUN set -e &&\
    curl -o /tmp/chrome.zip $CHROME_URL &&\
    unzip /tmp/chrome.zip -d /opt &&\
    rm -rf /tmp/chrome.zip


RUN set -e &&\
    curl -o /tmp/chromedriver.zip $CHROMEDRIVER_URL &&\
    unzip /tmp/chromedriver.zip -d /opt &&\
    rm -rf /tmp/chromedriver.zip

RUN ls -la /opt/chromedriver-linux64
   
ENV PATH="/opt/chromedriver-linux64:/opt/chrome-linux64:${PATH}"

RUN set -e &&\
    apt install -y python3-pip

RUN set -e &&\
    pip3 install --break-system-packages selenium

RUN apt install -y libnss3-dev libasound2-dev

