import go.Byte;
import go.Bytes;
import go.Syntax;
//import go.github_com.hajimehoshi.ebiten.v2.Ebitenutil;
//import go.github_com.hajimehoshi.ebiten.v2.Image;
//import go.github_com.hajimehoshi.ebiten.Ebiten;
//import go.Pointer;
//import go.GoInt;
//import go.Error;
//import go.Tuple;
//
//class Game {
//
//    public function new() {
//        return;
//    }
//
//    @:go.Export
//    public function draw(screen: Pointer<Image>): Void {
//        Ebitenutil.debugPrint(screen, "Hello, World!");
//    }
//
//    @:go.Export
//    public function update(): Error {
//        return null;
//    }
//
//    @:go.Export
//    @:go.Tuple("screenWidth", "screenHeight")
//    public function layout(outsideWidth: GoInt, outsideHeight: GoInt): Tuple<{ screenWidth: GoInt, screenHeight: GoInt }> {
//        return { screenWidth: 640, screenHeight: 480 };
//    }
//
//}
//
//function main() {
//    Ebiten.setWindowSize(640, 480);
//    Ebiten.setWindowTitle("Hello, World!");
//    Ebiten.runGame(new Game()).sure();
//}

@:structInit class Foo{}
@:structInit class Bar{}

enum A {
    A1;
    A2;
}

enum B {
    B1;
    B2;
}

function main() {
    var t = (42:go.Float64);
    trace(Std.isOfType(t, Float));
    trace(Type.typeof(t));

    var v = true;
    trace(Std.isOfType(v, Bool));
    trace(Type.typeof(v));

    var q1: Foo = {};
    var q2: Bar = {};
    trace(Std.isOfType(q1, Foo), Std.isOfType(q2, Foo));
    trace(Std.isOfType(q1, Bar), Std.isOfType(q2, Bar));
    trace(Type.typeof(q1), Type.typeof(q2));

    var e1: A = A.A1;
    var e2: B = B.B1;
    trace(Std.isOfType(e1, A), Std.isOfType(e2, A));
    trace(Std.isOfType(e1, B), Std.isOfType(e2, B));
    trace(Type.typeof(e1), Type.typeof(e2));
}