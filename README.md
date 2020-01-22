# lest
Minimal testing library for Lua.

Check [example/functions.test.lua](./example/functions.test.lua) for exemplary usage.

## Install
Simply copy and require `lest.lua`. Here's a one-liner that downloads
the latest version of the file to the current directory:
```
curl -O https://raw.githubusercontent.com/Nikaoto/lest/master/lest.lua
```

Calling `make test` will run the test suite with luajit. Every test
should pass if you have luajit installed correctly.

Pull requests are welcome.
