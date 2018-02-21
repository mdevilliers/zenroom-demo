FROM bitnami/minideb:stretch

RUN install_packages curl ca-certificates

RUN curl -Lo zenroom-static https://sdk.dyne.org:4443/view/decode/job/zenroom-static-amd64/lastStableBuild/artifact/src/zenroom-static \
    && chmod +x zenroom-static

COPY 01_generate_key_pairs.lua 01_generate_key_pairs.lua
COPY 02_encrypt_data_on_device.lua 02_encrypt_data_on_device.lua
COPY 03_decrypt_data_with_wallet.lua 03_decrypt_data_with_wallet.lua
COPY 98_encrypt.lua 98_encrypt.lua

ENTRYPOINT ./zenroom-static
