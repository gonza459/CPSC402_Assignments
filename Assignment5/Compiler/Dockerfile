# Jonathan Burns, May 05, 2020
# Run as `docker build . -t compiler`.

# The latest version of node is what breaks things.
# Comment out the other 'FROM' an uncomment this
# one to reproduce.
# FROM node:14.1.0-stretch

FROM node:10.15.3-stretch

# Install locale
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y locales \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8 
ENV LC_ALL en_US.UTF-8

# Add to PATH
ENV PATH=$PATH:/root/.local/bin

WORKDIR /app

# Install haskell stack
RUN curl -sSL https://get.haskellstack.org/ | sh

# Install node dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Install haskell compiler
RUN stack --resolver=ghc-8.6.4 setup

# Copy over files, and run tests
COPY . .
RUN stack test
