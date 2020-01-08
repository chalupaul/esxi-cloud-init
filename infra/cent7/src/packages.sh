#!/usr/bin/env bash

sudo yum update -y

sudo yum install -y \
    patch \
    bzip2 \
    tar \
    kernel-headers \
    kernel-devel \
    gcc \
    git \
    openssl-devel \
    bzip2-devel \
    readline-devel \
    sqlite-devel \
    libxml2-devel \
    libxslt-devel \
    libcurl-devel \
    nss-devel
