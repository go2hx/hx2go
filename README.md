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

Run the Haxe compiler using the altered `.hxml` once before trying to access the externs to allow the compiler to generate them.

Alter ``Main.hx`` to:

```haxe
import go.github_com.guptarohit.Asciigraph;

function main() {
	var data:Array<Float> = [3, 4, 9, 6, 2, 4, 5, 8, 5, 10, 2, 7, 2, 5, 6];
	var graph:String = Asciigraph.plot(data);
	trace("\n" + graph);
}
```

## Being compatible with Go interfaces
In some libraries like ebiten or bubbletea a class must be compatible with a given interface.
This is not the case by default, as such, you must use ``@:go.Export``. 
By using this meta you create some aliases where go-compatible names are used and types like
``go.Tuple<T>`` are brought back to actual tuples. Try the following:

Add the go library flag to your `.hxml`:

```hxml
-D go-lib=github.com/hajimehoshi/ebiten/v2
-D go-lib=github.com/hajimehoshi/ebiten/v2/ebitenutil
```

Run the Haxe compiler using the altered `.hxml` once before trying to access the externs to allow the compiler to generate them.

Alter ``Main.hx`` to:

```haxe
import go.github_com.hajimehoshi.ebiten.v2.Ebitenutil;
import go.github_com.hajimehoshi.ebiten.v2.Ebiten;
import go.github_com.hajimehoshi.ebiten.v2.Image;
import go.Pointer;
import go.GoInt;
import go.Error;
import go.Tuple;

class Game {

    public function new() {
        return;
    }

    @:go.Export
    public function draw(screen: Pointer<Image>): Void {
        Ebitenutil.debugPrint(screen, "Hello, World!");
    }

    @:go.Export
    public function update(): Error {
        return null;
    }

    @:go.Export
    @:go.Tuple("screenWidth", "screenHeight")
    public function layout(outsideWidth: GoInt, outsideHeight: GoInt): Tuple<{ screenWidth: GoInt, screenHeight: GoInt }> {
        return { screenWidth: 640, screenHeight: 480 };
    }

}

function main() {
    Ebiten.setWindowSize(640, 480);
    Ebiten.setWindowTitle("Hello, World!");
    Ebiten.runGame(new Game()).sure();
}
```

Note how ``Ebiten.runGame`` has the following signature in go:
```go
func RunGame(game Game) error
```

Where ``Game`` is:
```go
type Game interface {
    Update() error
    Draw(screen *Image)
    Layout(outsideWidth, outsideHeight int) (screenWidth, screenHeight int)
}
```

Due to the usage of ``@:go.Export`` on these 3 functions, the Haxe class can be used as the implementation for this Go interface.

## Usage of Go's language features
**Goroutines / Channels**
```haxe
import go.Chan;
import go.Syntax;

function sum(c: Chan<Int>, values: Array<Int>): Void {
    var sum = 0;
    for (value in values) {
        sum += value;
    }

    c.send(sum);
}

function main() {
    var arr: Array<Int> = [7, 2, 8, -9, 4, 0];
    var ch: Chan<Int> = new Chan();

    Syntax.go(sum.bind(ch, arr.slice(0, 3)));
    Syntax.go(sum.bind(ch, arr.slice(3, 6)));

    var x = ch.receive();
    var y = ch.receive();

    trace(x, y, x + y);
}
```

**Select**
```haxe
import go.Syntax;
import go.Chan;

function fib(c: Chan<Int>, quit: Chan<Int>) {
    var x = 0;
    var y = 1;
    var f = true;

    while (f) {
        Syntax.select(
            Select.send(c, x, () -> {
                var v = x;
                x = y;
                y = v + y;
            }),
            Select.receive(quit, _ -> {
                trace("quit");
                f = false;
            })
        );
    }
}

function main() {
    var chan: Chan<Int> = new Chan();
    var quit: Chan<Int> = new Chan();

    Syntax.go(() -> {
        for (i in 0...10) {
            trace(chan.receive());
        }

        quit.send(0);
    });

    fib(chan, quit);
}
```

**Defer**
```haxe
import go.Syntax;

function main() {
    Syntax.defer(() -> trace("Second!"));
    trace("First!");
}
```

**Fixed-size Arrays**
```haxe
import go.crypto.Sha256_;
import go.GoArray;
import go.Byte;
import go.Slice;

function main() {
  var fixed: GoArray<Byte, 32> = Sha256_.sum256("Hello, World!");
  for (value in fixed) {
    trace(value);
  }

  trace(fixed[0]);
  fixed[3] = 42; // works like normal

  var slice: Slice<Byte> = fixed; // [N]T -> []T can be implicit
  trace(slice);

  slice[0] = 123;

  trace(fixed[0], slice[0]); // not copied

  var array: Array<Byte> = slice;

  array[0] = 111;

  trace(fixed[0], slice[0], array[0]); // Array<T>, Slice<T> and GoArray<T, N> all hold the same identity

  array.push(0); // at this point Array<T> has grown, and doesn't share the identity with GoArray<T, N> and Slice<T> anymore
  array[0] = 222;

  trace(fixed[0], slice[0], array[0]);

  // please be careful with casts to array as they *may* share identity, but they *may* not.
  // consider using copy() when casting Slice<T> to Array<T>
  // GoArray<T, N> = [N]T
  // Slice<T> = []T
  // Array<T> = *[]T
}
```

**Raw syntax**
```haxe
import go.Syntax;

function main() {
    var result = Syntax.code("{0} + 5", 10); // beware: types are *not* checked
    trace(result);
}
```

## Haxe unit tests
<img src="https://go2hx.github.io/hx2go/graph.png"/>

> ℹ️ The above graph updates in real-time as new changes are merged upstream.

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
