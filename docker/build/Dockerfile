# docker build . -f docker/build/Dockerfile -t distributed-wikipedia-mirror:build
# docker run --rm -v $(pwd)/snapshots:/github/workspace/snapshots -v $(pwd)/tmp:/github/workspace/tmp distributed-wikipedia-mirror:build <mirrorzim.sh arguments>

FROM openzim/zim-tools:3.1.0 AS openzim

FROM node:16.14.0-buster-slim

RUN apt update && apt upgrade && apt install -y curl rsync

COPY --from=openzim /usr/local/bin/zimdump /usr/local/bin

RUN mkdir -p /github/distributed-wikipedia-mirror
RUN mkdir -p /github/workspace/snapshots
RUN mkdir -p /github/workspace/tmp

COPY . /github/distributed-wikipedia-mirror

VOLUME [ "/github/workspace" ]

WORKDIR /github/workspace
ENTRYPOINT [ "/github/distributed-wikipedia-mirror/docker-entrypoint.sh" ]
