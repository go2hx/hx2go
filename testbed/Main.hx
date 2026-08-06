import go.Byte;
import go.Bytes;
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

//import haxe.Int64.*;
//import haxe.Int64;
//
//function main() {
//    var a:Int64;
//    a = Int64.make(10, 0xFFFFFFFF);
//    trace(a.low==0xFFFFFFFF, a.low , 0xFFFFFFFF);
//    a = 47244640255i64;
//    trace(a.low==0xFFFFFFFF, a.low , 0xFFFFFFFF);
//    a = 0x7FFFFFFFFFFFFFFFi64;
//    trace(a.low==0xFFFFFFFF, a.low , 0xFFFFFFFF);
//}

import haxe.io.Bytes;

function main() {
    var a: Array<Int> = [1, 2, 3];
    var i: Int = 1;
    var v: Int = a[i];
    trace(a, i, v);
}