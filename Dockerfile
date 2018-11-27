FROM alpine

ARG HELM_LATEST_VERSION="v2.11.0"
ARG OSSUTIL_VERSION="1.4.1"

RUN apk add --no-cache --virtual .build-deps \
    curl && \
    curl -fSL https://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz -o helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz && \
    tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin && \
    rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz && \
    rm -rf linux-amd64 && \
    curl -fSL https://gosspublic.alicdn.com/ossutil/${OSSUTIL_VERSION}/ossutil64 -o /usr/local/bin/ossutil && \
    chmod +x /usr/local/bin/ossutil && \
    apk del .build-deps

CMD ["helm", "help"]
