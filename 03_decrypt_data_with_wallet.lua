
string = require "string"

-- remove any line returns
input = string.gsub(DATA, '\n$', '')

json = cjson()
keys = json.decode(KEYS)

nonce= string.sub (input, 0, 44)
enc = string.sub( input, 45 )

decrypt_session = exchange_session_x25519(
	  decode_b58(keys.user_private_key),
	  decode_b58(keys.device_public_key))

print( decrypt_norx(decrypt_session, decode_b58(nonce),decode_b58( enc)))
