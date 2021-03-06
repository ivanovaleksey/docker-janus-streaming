#!/bin/bash

PROJECT='janus-ex-streaming'
PROJECT_DIR="/opt/sandbox/${PROJECT}"
DOCKER_CONTAINER_NAME="sandbox/${PROJECT}"
DOCKER_CONTAINER_COMMAND=${DOCKER_CONTAINER_COMMAND:-'/bin/bash'}
DOCKER_RUN_OPTIONS=${DOCKER_RUN_OPTIONS:-'-ti --rm'}
SRC_DIR_C=${SRC_DIR_C:-'/Users/aleksey/projects/media/janus-streaming-c'}
SRC_DIR_RS=${SRC_DIR_RS:-'/Users/aleksey/projects/media/janus-streaming-rs'}

read -r DOCKER_RUN_COMMAND <<-EOF
    service nginx start \
    && /opt/janus/bin/janus
EOF

docker build -t ${DOCKER_CONTAINER_NAME} .
docker run ${DOCKER_RUN_OPTIONS} \
    -v $(pwd):${PROJECT_DIR} \
    -v ${SRC_DIR_C}:"${PROJECT_DIR}/janus-streaming-c" \
    -v ${SRC_DIR_RS}:"${PROJECT_DIR}/janus-streaming-rs" \
    -p 8443:8443 \
    -p 8089:8089 \
    -p 5002:5002/udp \
    -p 5004:5004/udp \
    ${DOCKER_CONTAINER_NAME} \
    /bin/bash -c "set -x && cd ${PROJECT_DIR} && ${DOCKER_RUN_COMMAND} && set +x && ${DOCKER_CONTAINER_COMMAND}"
