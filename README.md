# dockerfile-jenkins-slave-ubuntu-trusty-build-deb

[![Build Status](https://travis-ci.org/infOpen/dockerfile-jenkins-slave-ubuntu-trusty-build-deb.svg?branch=master)](https://travis-ci.org/infOpen/dockerfile-jenkins-slave-ubuntu-trusty-build-deb)

Dockerfile used to build a base jenkins slave image used to build ubuntu packages

## Warning

We use gosu to build packages with a non root user.
To be used with jenkins user, need to set setuid so take care about commands
launch in container with gosu.

