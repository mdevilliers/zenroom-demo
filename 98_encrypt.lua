
json = cjson_safe()

data = "{ temp : 22.3 }"

user_pk, user_sk = keygen_session_x25519()

device_pk, device_sk = keygen_session_x25519()

nonce=randombytes(32)

encrypt_session = exchange_session_x25519(
	  device_sk,
	  user_pk)

enc = encrypt_norx(encrypt_session, nonce, data)

decrypt_session = exchange_session_x25519(
	  user_sk,
	  device_pk)

print( decrypt_norx(decrypt_session, nonce, enc))
