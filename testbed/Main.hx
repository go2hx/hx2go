import go.github_com.hajimehoshi.ebiten.v2.Image;
import go.Error;
import go.github_com.hajimehoshi.ebiten.v2.Ebitenutil;
import go.Tuple;
import go.github_com.hajimehoshi.ebiten.v2.Ebiten;

@:go.Native
class Game {

    public function new() {
        // ...
    }

    public function update(): Error {
        return null;
    }

    public function draw(screen: Image): Void {
        Ebitenutil.debugPrint(screen, "Hello, World!");
    }

    public function layout(outsideWidth: Int, outsideHeight: Int): Tuple<{ screenWidth: Int, screenHeight: Int }> {
        return { screenWidth: outsideWidth, screenHeight: outsideHeight };
    }

}

class Main {

    public static function main() {
        Ebiten.setWindowSize(640, 480);
        Ebiten.setWindowTitle("Haxe Window");
        Ebiten.runGame(cast new Game());
    }

}