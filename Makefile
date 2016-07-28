.PHONY: test lint

test: rock
	@busted -v -o gtest

lint: rock
	@luacheck src --std luajit

rock:
	@luarocks make