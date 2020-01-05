# Makefile

test:
	luajit example/*.test.lua

lint:
	luacheck example lest.lua print_table.lua

.PHONY: lint test
