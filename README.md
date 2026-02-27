# hx2go

Work in progress Go target for the Haxe programming language.
Written in Haxe, open to contributions, stay tuned!

## Setup
- [Go 1.21.3+](https://go.dev/dl/)
- [Haxe nightly](https://haxe.org/download/nightlies/)
- Download the necessary Haxe libraries with the commands below:
```sh
haxelib git hxparse https://github.com/Simn/hxparse
haxelib git haxeparser https://github.com/HaxeCheckstyle/haxeparser
```

- Add to your hxml
```sh
# sets to run the Go code after
-D run-go
-D build-go
# set the output directory
--custom-target go=export/output.go
```

### Quick testing within hx2go repo
```sh
cd hx2go
haxe testbed.hxml
```
Feel free to modify [./testbed/Test.hx](./testbed/Test.hx)


### [Also check out the wiki!](https://github.com/go2hx/hx2go/wiki)