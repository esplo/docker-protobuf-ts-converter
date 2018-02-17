FROM node:9.5.0-alpine
LABEL maintainer="esplo@users.noreply.github.com"

RUN apk add --update \
    && apk add --no-cache protobuf \
    && rm -rf /var/cache/apk/*

COPY package.json ./
RUN npm i --verbose

CMD [ \
  "./node_modules/.bin/chokidar", \
  "/src/*.proto", \
  "-c", \
  "protoc \
    --plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts \
    --js_out=import_style=commonjs,binary:/dist \
    --ts_out=service=true:/dist \
    -I /src \
    /src/*.proto" \
]
