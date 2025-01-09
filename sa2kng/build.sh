#!/bin/bash
export DOCKER_BUILDKIT=1
TAG="sa2kng"
REPO_ROOT="knegge"
GNURADIO_IMAGE_TAG="3.10.5.1-satnogs"

ARGS="  --build-arg GNURADIO_IMAGE_TAG=${GNURADIO_IMAGE_TAG}"
ARGS+=" --build-arg GRSATNOGS_URL=https://gitlab.com/librespacefoundation/satnogs/gr-satnogs.git"
ARGS+=" --build-arg GRSATNOGS_BRANCH=v3.0.0.1"
ARGS+=" --build-arg GRSATNOGS_VER=3.0.0.1"
ARGS+=" --build-arg FLOWGRAPHS_URL=https://gitlab.com/kerel-fs/satnogs-flowgraphs.git"
ARGS+=" --build-arg FLOWGRAPHS_BRANCH=1.5-gr3.10-alpha1"
ARGS+=" --build-arg FLOWGRAPHS_VER=1.6~git20250109.bd8631c"
ARGS+=" --build-arg CLIENT_URL=https://gitlab.com/librespacefoundation/satnogs/satnogs-client.git"
ARGS+=" --build-arg CLIENT_BRANCH=1.9.3"
#ARGS+=" --build-arg RTLSDR_URL=https://github.com/osmocom/rtl-sdr.git"
#ARGS+=" --build-arg RTLSDR_BRANCH=master"
#ARGS+=" --build-arg RTLSDR_VER=0.6.0+2+${TAG}"
#ARGS+=" --build-arg UHD_URL=http://archive.ubuntu.com/ubuntu/pool/universe/u/uhd/uhd_4.1.0.5-3.dsc"
#ARGS+=" --build-arg OBS_REPO=https://download.opensuse.org/repositories/home:/knegge:/branches:/home:/librespace:/satnogs-unstable/Debian_11/"
#ARGS+=" --build-arg REPO_ROOT=${REPO_ROOT}"
#ARGS+=" --build-arg CMAKE_BUILD_PARALLEL_LEVEL=8"

docker build \
    -t ${REPO_ROOT}/satnogs-client:${TAG} \
    ${ARGS} \
    . "$@"
