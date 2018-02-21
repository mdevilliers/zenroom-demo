json = cjson_safe()

keys = json.decode(arguments)

// nonce= TODO : read first 32 characters
// waiting for https://github.com/DECODEproject/zenroom/issues/3

decrypt_session = exchange_session_x25519(
	  decode_b58(keys.user_secret_key),
	  decode_b58(keys.device_public_key))

print( decrypt_norx(decrypt_session, nonce, enc))
