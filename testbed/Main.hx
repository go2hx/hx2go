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

class Base {

    public function new() {}
    public function foo() {
        trace("Foo from base");
    }

}

class Child extends Base {

    override public function foo() {
        trace("Foo from child");
    }
}

class Main {

    public static function identity(x: Base): Base {
        return x;
    }

    public static function main() {
        var child: Child = new Child();
        var base: Base = child;
        var child_dyn: Dynamic = child;
        var base_dyn: Dynamic = base;
        var base_from_dyn: Base = child_dyn;
        var child_from_dyn: Child = child_dyn;

        child.foo();
        base.foo();
        child_dyn.foo();
        base_dyn.foo();
        child_from_dyn.foo();
        base_from_dyn.foo();

        var closure_iden = identity;
        var closure_iden_dyn: Dynamic = identity;
        var res = closure_iden_dyn(child);

        res.foo();
    }

}