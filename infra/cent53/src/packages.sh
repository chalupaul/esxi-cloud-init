#!/usr/bin/env bash

sudo yum update -y

sudo yum install -y \
    bzip2 \
    tar \
    kernel-headers \
    kernel-devel \
    gcc \
    git \
    openssl-devel \
    bzip2-devel \
    readline-devel \
    sqlite-devel
