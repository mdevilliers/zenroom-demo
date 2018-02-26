Build the docker container using the last successful static build of zenroom

```
make docker_build
```

Run the container

```
make zenroom
```

Generate the keys for the wallet and the device

```
./zenroom-static 01_generate_key_pairs.lua > keys.json
```

Split into keys for device

```
cat ./keys.json | jq ".device" > device_keys.json
```

Split into keys for wallet

```
cat ./keys.json | jq ".wallet" > wallet_keys.json
```

Encrypt some data

```
./zenroom-static -k ./device_keys.json  ./02_encrypt_data_on_device.lua > data
```

Decrypt some data

```
cat ./data | ./zenroom-static -k ./wallet_keys.json ./03_decrypt_data_with_wallet.lua -
```
