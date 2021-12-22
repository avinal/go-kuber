# Golang base image
FROM golang:1.17.5-alpine3.15

# move to where source code will live
WORKDIR /go/src/go-kuber

# copy the source code to the container
COPY . .

# label for ghcr
LABEL org.opencontainers.image.author="Avinal Kumar <avinal.xlvii@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/avinal/go-kuber"
LABEL org.opencontainers.image.version="latest"
LABEL org.opencontainers.image.description="Deploying go apps with kubernetes"

# get any dependencies
RUN CGO_ENABLED=0 go get -v ./...

# start from a empty image
FROM scratch

# copy the binary
COPY --from=0 /go/bin/go-kuber /

# run the binary
ENTRYPOINT ["/go-kuber"]
