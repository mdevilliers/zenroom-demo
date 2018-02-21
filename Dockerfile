FROM bitnami/minideb:stretch

RUN install_packages curl ca-certificates

RUN curl -Lo zenroom-static https://sdk.dyne.org:4443/view/decode/job/zenroom-static-amd64/lastStableBuild/artifact/src/zenroom-static \
    && chmod +x zenroom-static

ENTRYPOINT ./zenroom-static
