-- script creates a public, private key using X25519
-- for both a user and a device
-- outputs to json

json = cjson()

user_pk, user_sk = keygen_session_x25519()

device_pk, device_sk = keygen_session_x25519()

keypair = json.encode(
   {
    device ={
        device_secret_key = encode_b58( device_sk ),
        user_public_key   = encode_b58( user_pk )
            },
     wallet ={
        device_public_key = encode_b58( device_pk ),
        user_private_key  = encode_b58( user_sk )
    }
})

print(keypair)
