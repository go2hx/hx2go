<h1 align="center">hx2go</h1>

<p align="center">
  <strong>The Go target for Haxe</strong>
</p>

<p align="center">
  <a href="https://github.com/go2hx/hx2go/actions/workflows/main.yml"><img src="https://github.com/go2hx/hx2go/actions/workflows/main.yml/badge.svg" alt="Build Status"></a>
  <a href="#installation"><img src="https://img.shields.io/github/languages/top/go2hx/hx2go
  "></a>
  <a href="#license"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License"></a>
  <img src="https://img.shields.io/badge/status-experimental-orange.svg" alt="Status: released">
</p>

---

Write ordinary Haxe and get Go source you
can build with the standard `go` toolchain.

- **Go interop** - [automatic extern generation](#automatic-extern-generation), and interop between Haxe and Go types.
- **Self compiled** - the compiler runs on the Go target itself.
- **Custom target** - integrates through Haxe's `--custom-target` define; no forked compiler required.
- **Written in Haxe** - entire compiler + stdlib code is written in Haxe.
- **Concurrency** - use goroutines, channels, and `select` (``go.Syntax.select``).

> ⚠️ **Experimental.** hx2go is under active development.
> Expect rough edges and breaking changes.

## Requirements

- [Haxe nightly](https://haxe.org/download/nightlies/) `5.0.0-preview.1+957b2c7` or newer
- [Go 1.26 or higher](https://go.dev/dl/)

## Installation

Install the library via haxelib:

```sh
haxelib git hx2go https://github.com/go2hx/hx2go
```

## Usage

Add the target flags to your `.hxml`:

```hxml
-L hx2go
--custom-target go=output
# Build and run the generated module
--cmd go -C output/main run .
```

Given a `Main.hx`:

```haxe
function main() {
    trace("Hello from Haxe, running on Go!");
}
```

Compiling with the flags above generates a Go module under `output/main` and runs it.

#### Building

Change ``go run`` to ``go build``:
```sh
--cmd go build ./output/main
```
In order to get an executable located at ``./output/main/main/``.

## Automatic extern generation

Add the target flag to your `.hxml`:

```hxml
-D go-lib=net/http
```

Run the program once before trying to access the extern's to allow the compiler to generate them.

Now given a ``Main.hx`` you can add the following and launch an HTTP file server:

```haxe
import go.net.Http;
import go.net.http.Dir;

function main() {
  var port = ":8082";
	trace('http file server: http://localhost$port');

  var dir:Dir = ".";
	var err = Http.listenAndServe(port, Http.fileServer(dir));
  trace(err);
}
```


## Contributing

Contributions are welcome. Please open an issue to discuss substantial changes
before sending a pull request.


### Dev env
```sh
git clone https://github.com/go2hx/hx2go --recursive
cd hx2go
haxelib dev hx2go .
```

## License

hx2go is open-source software licensed under the [MIT license](https://opensource.org/license/MIT).

Creators: Mikaib, Elliott Stoneham, PXshadow.