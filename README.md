A Lua wrapper for the OpenBSD implementation of bcrypt using LuaJIT FFI.

Requirements
------------
luabcrypt-ffi requires OpenSSL (for salt generation) and LuaJIT with luarocks to compile.


Usage
-----
	require( "bcrypt-ffi" )

	local digest = bcrypt.digest( "password", 10 )
	assert( bcrypt.verify( "password", digest ) )