<h1 align="center">hx2go</h1>

<p align="center">
  <strong>A Go target for Haxe</strong>
</p>

<p align="center">
  <a href="https://github.com/go2hx/hx2go/actions/workflows/main.yml"><img src="https://github.com/go2hx/hx2go/actions/workflows/main.yml/badge.svg" alt="Build Status"></a>
</p>

---

> ⚠️ **Experimental** under active development.

## Requirements

- [Haxe nightly](https://haxe.org/download/nightlies/) 
  - `5.0.0-preview.1+957b2c7` or newer
- [Go](https://go.dev/dl/) 
  - `1.27` or newer

## Haxe unit tests
<img src="https://go2hx.github.io/hx2go/graph.png"/>

> ℹ️ The above graph updates as new changes are committed in.

## Installation

Install via haxelib:

```sh
haxelib git hx2go https://github.com/go2hx/hx2go
```

## Usage

For detailed information check out the [**wiki**](https://github.com/go2hx/hx2go/wiki#hx2go).

Add the target flags to your `.hxml`:

```hxml
-L hx2go
--xml output/target.xml # needed if using haxe.rtti
--custom-target go=output
--cmd go -C output/main run . # builds and runs the outputted Go code
```

Given a `Main.hx`:

```haxe
function main() {
    trace("Hello from Haxe, running on Go!");
}
```

Compiling with the flags above generates a Go module under `output/main` and runs the resulting Go code.


### Building an executable

Change ``go run`` to ``go build``:
```sh
--cmd go build ./output/main
```
It will create an executable located at ``./output/main/main`` (on Windows OS with the extension ``.exe``).

### Using Go's stdlib

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

### Using automatic externs

For example, to print the ASCII graph below:
```
Main.hx:6: 
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

Alter ``Main.hx`` to:

```haxe
import go.github_com.guptarohit.Asciigraph;

function main() {
	var data:Array<Float> = [3, 4, 9, 6, 2, 4, 5, 8, 5, 10, 2, 7, 2, 5, 6];
	var graph:String = Asciigraph.plot(data);
	trace("\n" + graph);
}
```


## Contributing

Contributions are welcome. Please open an issue to discuss substantial changes before sending a pull request.

### Dev env
```sh
git clone https://github.com/go2hx/hx2go --recursive
cd hx2go
haxelib dev hx2go .
```

#### Tests
Install utest:
```sh
haxelib git utest https://github.com/haxe-utest/utest/
```

Runs the tests found in ``./tests``
```sh
haxe Tests.hxml
```
Runs the Haxe compiler's unit tests
```
haxe scripts/haxeunit.hxml
haxe scripts/haxeunit.hxml -D threads
haxe scripts/haxeunit.hxml -D testsys
```

### Created with craftsman ship

Creators: Mikaib, Elliott Stoneham, PXshadow.