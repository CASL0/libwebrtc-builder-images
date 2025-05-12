[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![License](https://img.shields.io/badge/license-MIT-blue)](https://opensource.org/license/mit)

# libwebrtc-builder-images

Docker image with all dependencies to build Google's [libwebrtc](https://webrtc.googlesource.com/src/) from source.
Suitable for CI pipelines or local development.

## Getting Started

### Building libwebrtc for Android

1. Use the following commands to run a Docker image for libwebrtc for Android.

   ```sh
   docker container run --rm -it ghcr.io/casl0/libwebrtc-builder/android
   ```

1. Build libwebrtc for Android inside the container.

   ```sh
   fetch --nohooks webrtc_android
   gclient sync
   cd src && ./build/install-build-deps.sh
   tools_webrtc/android/build_aar.py
   ```
