# docker build . -f docker/publish/Dockerfile -t distributed-wikipedia-mirror:publish
# docker run --rm -v $(pwd)/tmp:/github/workspace/tmp distributed-wikipedia-mirror:publish

FROM stedolan/jq:latest AS jq
FROM ipfs/go-ipfs:v0.12.0

COPY --from=jq /usr/local/bin/jq /usr/local/bin

COPY tools/add_to_ipfs.sh /usr/local/bin/add_to_ipfs.sh
COPY tools/configure_ipfs.sh /usr/local/bin/configure_ipfs.sh

COPY docker/publish/docker-entrypoint.sh /usr/local/bin

RUN configure_ipfs.sh

RUN mkdir -p /github/workspace/tmp
VOLUME [ "/github/workspace" ]

WORKDIR /github/workspace
ENTRYPOINT [ "docker-entrypoint.sh" ]
