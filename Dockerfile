FROM golang:1.17 AS builder
WORKDIR /go/src/open-cluster-management.io/resource-usage-collect
COPY . .
ENV GO_PACKAGE open-cluster-management.io/resource-usage-collect

RUN make build --warn-undefined-variables

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
COPY --from=builder /go/src/open-cluster-management.io/resource-usage-collect/addon /

#RUN microdnf update && microdnf clean all
