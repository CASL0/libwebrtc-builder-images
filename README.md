[![Publish Docker Image](https://github.com/CASL0/libwebrtc-builder-images/actions/workflows/publish.yml/badge.svg)](https://github.com/CASL0/libwebrtc-builder-images/actions/workflows/publish.yml)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![License](https://img.shields.io/badge/license-MIT-blue)](https://opensource.org/license/mit)

# libwebrtc-builder-images

Docker image with all dependencies to build Google's [libwebrtc](https://webrtc.googlesource.com/src/) from source.
Suitable for CI pipelines or local development.

## Getting Started

### Building libwebrtc for Android

1. Use the following commands to run a Docker image for libwebrtc for Android.

   ```sh
   docker container run --rm -it ghcr.io/casl0/libwebrtc-builder/ubuntu
   ```

1. Build libwebrtc for Android inside the container.

   ```sh
   fetch --nohooks webrtc_android
   gclient sync
   cd src
   ./build/install-build-deps.sh
   tools_webrtc/android/build_aar.py
   ```

### Building libwebrtc for Linux

1. Use the following commands to run a Docker image for libwebrtc for Linux.

   ```sh
   docker container run --rm -it ghcr.io/casl0/libwebrtc-builder/ubuntu
   ```

1. Build libwebrtc for Linux inside the container.

   ```sh
   fetch --nohooks webrtc
   gclient sync
   cd src
   ./build/install-build-deps.sh
   gn gen out/Default
   autoninja -C out/Default
   ```

### Building libwebrtc for Windows

1. Use the following commands to run a Docker image for libwebrtc for Windows.

   ```sh
   docker container run --rm -it ghcr.io/casl0/libwebrtc-builder/windows
   ```

1. Build libwebrtc for Windows inside the container.

   ```sh
   # WORKAROUND: Because the owner of C:\depot_tools is NT AUTHORITY\SYSTEM
   icacls "C:\depot_tools" /setowner ContainerAdministrator /T
   fetch --nohooks webrtc
   gclient sync
   cd src
   gn gen out/Default
   autoninja -C out/Default
   ```

## Available Images

| Image                                     | Purpose                                 |
| ----------------------------------------- | --------------------------------------- |
| `ghcr.io/casl0/libwebrtc-builder/ubuntu`  | Building libwebrtc for Android or Linux |
| `ghcr.io/casl0/libwebrtc-builder/windows` | Building libwebrtc for Windows          |
