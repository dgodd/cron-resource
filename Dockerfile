FROM crystallang/crystal
WORKDIR /app
ADD . /app
RUN shards install
RUN shards build

FROM alpine:latest
WORKDIR /opt
COPY --from=0 /app/bin/* /opt
