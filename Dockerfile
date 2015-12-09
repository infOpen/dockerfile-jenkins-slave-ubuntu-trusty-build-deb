FROM infopen/jenkins-slave-ubuntu-trusty:0.2.0
MAINTAINER Alexandre Chaussier <a.chaussier@infopen.pro>

# Install packages to build deb packages
RUN apt-get update && \
    apt-get install -y  build-essential=11.6* \
                        cdbs=0.4.122* \
                        curl=7.35.0* \
                        debhelper=9.20131227* \
                        debootstrap=1.0.59* \
                        devscripts=2.14.1* \
                        dh-make=0.63* \
                        fakeroot=1.20* \
                        lintian=2.5.22* \
                        pbuilder=0.215*

# Create user for build
RUN useradd -m \
            -s /bin/bash \
            build-user

# Set password for jenkins user
RUN echo "build-user:build-user" | chpasswd

# Get gosu GPG key
RUN gpg --keyserver ha.pool.sks-keyservers.net \
        --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4

# Install Gosu
ENV GOSU_VERSION 1.7
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture)" \
 && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture).asc" \
 && gpg --verify /usr/local/bin/gosu.asc \
 && rm /usr/local/bin/gosu.asc \
 && chown root:jenkins /usr/local/bin/gosu \
 && chmod 4750 /usr/local/bin/gosu

