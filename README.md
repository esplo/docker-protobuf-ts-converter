# docker-protobuf-ts-converter

Docker container for **continuously** convert *.proto files into .ts/.js files.

## Based on...

- [google/protobuf](https://github.com/google/protobuf)
- [improbable-eng/ts-protoc-gen](https://github.com/improbable-eng/ts-protoc-gen)

## Feature

- watch file changes
- small image size (80.2MB, 2018/02/17)

## Usage

```
$ docker build . -t dptc
$ docker run \
    -v /your/protobuf/dir:/src \
    -v /frontend/protobuf/dir:/dist \
    -e SHELL=sh \
    dptc
```

or in docker-compose.yml

```
  converter:
    build: ./this/dir or use image 'esplo/docker-protobuf-ts-converter'
    volumes:
      - /your/protobuf/dir:/src
      - /frontend/protobuf/dir:/dist
    environment:
      - SHELL=/bin/sh
```
