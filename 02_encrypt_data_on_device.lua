
json = cjson()
keys = json.decode(KEYS)

data = "{ 'temp' : 22.3 }"

nonce=randombytes(32)

encrypt_session = exchange_session_x25519(
	  decode_b58(keys.device_secret_key),
	  decode_b58(keys.user_public_key))

enc = encrypt_norx(encrypt_session, nonce, data)

-- notice we are adding the nonce to the beginning of the 
-- encrypted value
print (encode_b58(nonce) .. encode_b58(enc))
