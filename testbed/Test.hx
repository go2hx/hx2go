import go.Float64;
import go.Syntax;
import go.Go;
import go.Int32;
import go.Float32;
import go.Slice;
import go.Fmt;

@:go.package("image/color")
@:go.native("color.RGBA")
extern class RGBA {}

@:go.package("math/rand")
@:go.native("rand")
extern class Rand {
    @:go.native("Float64")
    public static extern function Float64(): Float64;
}

@:go.package("github.com/gen2brain/raylib-go/raylib")
@:go.native("rl")
extern class Raylib {
    public static extern var White: RGBA;  // maps to rl.White
    public static extern var Black: RGBA; // maps to rl.Black
    public static extern var Lime: RGBA; // maps to rl.Black
    public static extern var DarkGreen: RGBA; // maps to rl.Black
    public static extern var Red: RGBA;
    public static extern var Green: RGBA;
    public static extern var Gray: RGBA;

    @:go.native("InitWindow") // could be removed if function name was "InitWindow"
    public static extern function InitWindow(width: Int32, height: Int32, title: String): Void;

    @:go.native("SetTargetFPS")
    public static extern function SetTargetFPS(fps: Int32): Void;

    @:go.native("WindowShouldClose")
    public static extern function WindowShouldClose(): Bool;

    @:go.native("BeginDrawing")
    public static extern function BeginDrawing(): Void;

    @:go.native("EndDrawing")
    public static extern function EndDrawing(): Void;

    @:go.native("ClearBackground")
    public static extern function ClearBackground(colour: RGBA): Void;

    @:go.native("DrawFPS")
    public static extern function DrawFPS(x: Int32, y: Int32): Void;

    @:go.native("DrawCircle")
    public static extern function DrawCircle(x: Int32, y: Int32, radius: Float32, colour: RGBA): Void;

    @:go.native("DrawText")
    public static extern function DrawText(text: String, x: Int32, y: Int32, size: Int32, colour: RGBA): Void;

    @:go.native("DrawRectangle")
    public static extern function DrawRectangle(x: Int32, y: Int32, width: Int32, height: Int32, colour: RGBA): Void;

    @:go.native("CloseWindow")
    public static extern function CloseWindow(): Void;

    @:go.native("GetMouseX")
    public static extern function GetMouseX(): Int32;

    @:go.native("GetMouseY")
    public static extern function GetMouseY(): Int32;

    @:go.native("GetFrameTime")
    public static extern function GetFrameTime(): Float32;
}

@:dce(ignore)
@:analyzer(ignore)
class Test {
    public static function main() {
        Raylib.InitWindow(800, 600, "Sorting");
        Raylib.SetTargetFPS(240);

        var array_size: Int32 = 80;
        var bars: Slice<Float64> = new Slice();
        while (bars.length < array_size) {
            bars = bars.append(Rand.Float64() * 550 + 20);
        }

        var i = 0;
        var j = 0;
        var sorted = false;
        var swapped = false;
        var comparing_index = -1;
        var swap_index = -1;

        while (!Raylib.WindowShouldClose()) {
            if (!sorted) {
                if (j < array_size - i - 1) {
                    comparing_index = j;
                    swap_index = j + 1;

                    if (bars[j] > bars[j + 1]) {
                        var temp = bars[j];
                        bars[j] = bars[j + 1];
                        bars[j + 1] = temp;
                        swapped = true;
                    }
                    j++;
                } else {
                    i++;
                    j = 0;
                    if (!swapped) {
                        sorted = true;
                        comparing_index = -1;
                        swap_index = -1;
                    }
                    swapped = false;
                }
            }

            Raylib.BeginDrawing();
            Raylib.ClearBackground(Raylib.White);

            var bar_width = 800.0 / array_size;

            var k = 0;
            while (k < array_size) {
                var color = Raylib.Gray;

                if (k >= array_size - i) {
                    color = Raylib.Green;
                } else if (k == comparing_index || k == swap_index) {
                    color = Raylib.Red;
                }

                var x = k * bar_width;
                var height = bars[k];
                Raylib.DrawRectangle(
                    cast x,
                    cast (600 - height),
                    cast (bar_width - 1),
                    cast height,
                    color
                );

                k++;
            }

            if (sorted) {
                Raylib.DrawText("SORTED!", 350, 20, 30, Raylib.Green);
            }

            Raylib.DrawFPS(10, 10);
            Raylib.EndDrawing();
        }

        Raylib.CloseWindow();
    }
}
