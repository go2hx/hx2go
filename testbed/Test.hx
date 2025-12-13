import go.Float64;
import go.Syntax;
import go.Go;
import go.Int32;
import go.Float32;
import go.Slice;
import go.Fmt;

@:go.package("image/color")
@:go.native("color") // TODO: what would be best here?
extern class RGBA {}

@:go.package("github.com/gen2brain/raylib-go/raylib")
@:go.native("rl")
extern class Raylib {
    public static extern var White: RGBA;  // maps to rl.White
    public static extern var Black: RGBA; // maps to rl.Black
    public static extern var Lime: RGBA; // maps to rl.Black
    public static extern var DarkGreen: RGBA; // maps to rl.Black
    public static extern var Red: RGBA;

    @:go.native("InitWindow") // could be removed if function name was "InitWindow"
    public static extern function InitWindow(width: Int32, height: Int32, title: String): Void;

    @:go.native("SetTargetFPS")
    public static extern function SetTargetFps(fps: Int32): Void;

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

    @:go.native("CloseWindow")
    public static extern function CloseWindow(): Void;

    @:go.native("GetMouseX")
    public static extern function GetMouseX(): Int32;

    @:go.native("GetMouseY")
    public static extern function GetMouseY(): Int32;

    @:go.native("GetFrameTime")
    public static extern function GetFrameTime(): Float32;
}

//@:dce(ignore)
//@:analyzer(ignore)
class Test {
    public static function main() {
        // Syntax.code
        var foo: Int32 = Syntax.code("5 + {0}", 10);
        Fmt.Println(foo);

        // Slice#append
        var bar: Slice<Float64> = new Slice();
        bar = bar.append(1.0); // Go.append(slice, value) is also valid
        bar = bar.append(2);
        bar = bar.append(3);

        // Slice[n]
        bar[1] = bar[1] + 20.0;
        Fmt.Println(bar, bar.length, bar[1]);

        // Slice#slice
        var x = bar.slice(1);
        var y = bar.slice(0, 2);
        Fmt.Println(x, x.length);
        Fmt.Println(y, y.length);

        // Casts
        var a: Float32 = cast Go.float64(10);
        var b: Slice<Float32> = cast bar;
        Fmt.Println(a, b);

        //Raylib.InitWindow(800, 400, "raylib [core] example - basic window");

        //var target_x = 0.0;
        //var target_y = 0.0;
        //var vel_x = 0.0;
        //var vel_y = 0.0;
        //var current_x = 0.0;
        //var current_y = 0.0;

        //final stiffness = 10.0;
        //final damping = 2.0;

        //while (!Raylib.WindowShouldClose()) {
        //    target_x = Raylib.GetMouseX();
        //    target_y = Raylib.GetMouseY();

        //    var dx = current_x - target_x;
        //    var dy = current_y - target_y;

        //    var fx = -stiffness * dx;
        //    var fy = -stiffness * dy;

        //    var dmx = -damping * vel_x;
        //    var dmy = -damping * vel_y;

        //    var ax = fx + dmx;
        //    var ay = fy + dmy;

        //    var dt = Raylib.GetFrameTime();
        //    vel_x += ax * dt;
        //    vel_y += ay * dt;

        //    current_x += vel_x * dt;
        //    current_y += vel_y * dt;

        //    Raylib.BeginDrawing();
        //    Raylib.ClearBackground(Raylib.White);

        //    Raylib.DrawFPS(10, 10);
        //    Raylib.DrawCircle(cast target_x, cast target_y, 20.0, Raylib.Red);
        //    Raylib.DrawCircle(cast current_x, cast current_y, 15.0, Raylib.Lime);

        //    Raylib.EndDrawing();
        //}

        //Raylib.CloseWindow();

        //var n = 10;
        //var a = 0;
        //var b = 1;
        //var next = b;
        //var count = 1;

        //do {
        //    Fmt.println(next);
        //    var newC = count++;
        //    a = b;
        //    b = next;
        //    next = a + b;
        //} while (count <= n);

        //var x = 0;
        //var y = 0;
        //if (x > 5) y = x++;

        //var x = 0;
        //Fmt.println(x++);
        //Fmt.println(++x);

        //var x = 10, y = 12;
        //x = 15;
        //x++;

        //while (x > 20) {
        //    Fmt.println("A");
        //    x++ ;
        //}

        //if( x == 16 ) {
        //    Fmt.println("hello", 20 + x);
        //}else if (x == 20) {
        //    Fmt.println("hello", 20 + x);
        //}else if (x == 10) {
        //    Fmt.println("kkk");
        //}
    }
}
