FROM centos:latest

RUN yum install -y \
  epel-release \
  gcc \
  git \
  openssl-devel \
  ca-certificates \
  rubygems \
  curl \
  bison

RUN yum install -y \
  libmaxminddb-devel

RUN gem install \
  mgem \
  rake
