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

    var count = 0;

    @:go.Export
    public function update(): Error {
        count++;
        if (count > 60 * 5) {
            Sys.exit(0);
        }
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