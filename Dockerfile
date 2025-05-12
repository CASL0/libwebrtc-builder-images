FROM ubuntu:jammy-20250415.1

LABEL org.opencontainers.image.source="https://github.com/CASL0/libwebrtc-builder-images"

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        git-core \
        curl \
        ca-certificates \
        python3 \
        python3-setuptools \
        xz-utils \
        lsb-release \
        sudo \
        file

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools /opt/depot_tools \
    &&  git -C /opt/depot_tools switch -c 977c37458fda472d8822a8b57e4a83a7bc747471 977c37458fda472d8822a8b57e4a83a7bc747471

ENV PATH="/opt/depot_tools:$PATH"

WORKDIR /workspace
