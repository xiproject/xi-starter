FROM phusion/baseimage:0.9.16
ENV HTTP_PROXY http://10.3.100.207:8080
ENV HTTPS_PROXY http://10.3.100.207:8080
ENV http_proxy http://10.3.100.207:8080
ENV https_proxy http://10.3.100.207:8080
ENV DEBIAN_FRONTEND noninteractive
RUN echo 'Acquire::http::Proxy "http://10.3.100.207:8080";\nAcquire::https::Proxy "http://10.3.100.207:8080";' >> /etc/apt/apt.conf
RUN sudo apt-get update
RUN sudo apt-get install -y git build-essential
RUN echo "export https_proxy=http://10.3.100.207:8080\n$(curl -sL https://deb.nodesource.com/setup)" | sudo bash - && sudo apt-get install -y nodejs
RUN npm config set proxy $HTTP_PROXY && npm config set https-proxy $HTTPS_PROXY
RUN sudo npm install -g grunt-cli bunyan
RUN git clone https://github.com/xiproject/xi-core.git src/xi-core
RUN cd src/xi-core && npm install
