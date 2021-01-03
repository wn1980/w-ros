#REF: https://github.com/osrf/docker_images/blob/master/gazebo/9/ubuntu/xenial/gzweb9/Dockerfile

# This is an auto generated Dockerfile for gazebo:gzweb9
# generated from docker_images/create_gzweb_image.Dockerfile.em
FROM gazebo:libgazebo9-xenial

# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    imagemagick \
    libboost-all-dev \
    libgts-dev \
    libjansson-dev \
    libtinyxml-dev \
    git \
    curl \
    pkg-config \
    psmisc \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# install gazebo packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgazebo9-dev=9.16.0-1* \
    && rm -rf /var/lib/apt/lists/*

ENV NODE_VERSION=6.17.1

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
	
# clone gzweb
ENV GZWEB_WS /root/gzweb
RUN git clone http://github.com/osrf/gzweb $GZWEB_WS
#COPY gzweb $GZWEB_WS
WORKDIR $GZWEB_WS

# make a missing folder
CMD mkdir /root/gzweb/http/client/assets
    
# build gzweb
RUN git checkout gzweb_1.4.1 
RUN xvfb-run -s "-screen 0 1280x1024x24" bash -c "source /usr/share/gazebo/setup.sh && ./deploy.sh -m -t"

# setup environment
EXPOSE 8080
EXPOSE 7681

# run gzserver and gzweb
CMD gzserver --verbose & npm start