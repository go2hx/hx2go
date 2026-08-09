<h1 align="center">hx2go</h1>

<p align="center">
  <strong>A Go target for Haxe</strong>
</p>

<p align="center">
  <a href="https://github.com/go2hx/hx2go/actions/workflows/main.yml"><img src="https://github.com/go2hx/hx2go/actions/workflows/main.yml/badge.svg" alt="Build Status"></a>
  <a href="#license"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License"></a>
  <img src="https://img.shields.io/badge/status-experimental-orange.svg" alt="Status: released">
  <img src="https://img.shields.io/github/languages/top/go2hx/hx2go">
</p>

---

Write Haxe and get Go source output you
can build with the standard `go` toolchain.

- **Go interop** - [automatic extern generation](#automatic-extern-generation), and interop between Haxe and Go types.
- **Self compiled** - the compiler runs on the Go target itself.
- **Custom target** - integrates through Haxe's `--custom-target` define; no forked compiler required.
- **Written in Haxe** - entire compiler + stdlib code is written in Haxe.
- **Concurrency** - use goroutines, channels, and `select` (``go.Syntax.select``).

> ⚠️ **Experimental.** hx2go is under active development.
> Expect rough edges and breaking changes.

## Requirements

- [Haxe nightly](https://haxe.org/download/nightlies/) 
  - `5.0.0-preview.1+957b2c7` or newer
- [Go](https://go.dev/dl/) 
  - `1.26` or newer

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
It will create an executable located at ``./output/main/main`` (on Windows OS with the extension ``.exe``).

## Built-in Go standard library

For example, to launch an HTTP file server, alter ``Main.hx`` to:

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

## Automatic extern generation

For example, to print the ASCII graph below:
```
 10.00 ┤        ╭╮
  9.00 ┤ ╭╮     ││
  8.00 ┤ ││   ╭╮││
  7.00 ┤ ││   ││││╭╮
  6.00 ┤ │╰╮  ││││││ ╭
  5.00 ┤ │ │ ╭╯╰╯│││╭╯
  4.00 ┤╭╯ │╭╯   ││││
  3.00 ┼╯  ││    ││││
  2.00 ┤   ╰╯    ╰╯╰╯
```

Add the go library flag to your `.hxml`:

```hxml
-D go-lib=github.com/guptarohit/asciigraph
```

Run the Haxe compiler using the altered `.hxml` once before trying to access the externs to allow the compiler to generate them.

Alter ``Main.hx`` to:

```haxe
import go.Fmt;
import go.github_com.guptarohit.Asciigraph;

function main() {
	var data:go.Slice<Float> = [3, 4, 9, 6, 2, 4, 5, 8, 5, 10, 2, 7, 2, 5, 6];
	var graph:String = Asciigraph.plot(data);
	Fmt.println(graph);
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

#### Tests
*the tests require the [utest](https://github.com/haxe-utest/utest)* library

Runs the tests found at ``./tests``
```sh
haxe Tests.hxml
```
Runs the Haxe compiler's unit tests
```
haxe scripts/haxeunit.hxml
```

## License

hx2go is open-source software licensed under the [MIT license](https://opensource.org/license/MIT).

Creators: Mikaib, Elliott Stoneham, PXshadow.
