@:coreType @:notNull @:runtimeValue abstract Single to Float from Float {}

// NOTE: @:native causes the name to change in the dump file
// We only want to use the metadata to point to the Go reference api
@:go.package("fmt")
@:go.native("fmt")
extern class Fmt {
    @:go.native("Println")
	public static extern function Println(e:haxe.Rest<Dynamic>):Void;
}

@:go.toplevel
extern class Convert {
    @:go.native("int32")
    public static extern function int32(x: Float): Int;

    @:go.native("float32")
    public static extern function float32(x: Float): Single;
}

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

    @:go.native("InitWindow") // could be removed if function name was "InitWindow"
    public static extern function InitWindow(width: Int, height: Int, title: String): Void;

    @:go.native("SetTargetFPS")
    public static extern function SetTargetFps(fps: Int): Void;

    @:go.native("WindowShouldClose")
    public static extern function WindowShouldClose(): Bool;

    @:go.native("BeginDrawing")
    public static extern function BeginDrawing(): Void;

    @:go.native("EndDrawing")
    public static extern function EndDrawing(): Void;

    @:go.native("ClearBackground")
    public static extern function ClearBackground(colour: RGBA): Void;

    @:go.native("DrawText")
    public static extern function DrawText(str: String, x: Int, y: Int, size: Int, colour: RGBA): Void;

    @:go.native("DrawCircle")
    public static extern function DrawCircle(x: Int, y: Int, radius: Float, colour: RGBA): Void;

    @:go.native("CloseWindow")
    public static extern function CloseWindow(): Void;

    @:go.native("GetMouseX")
    public static extern function GetMouseX(): Int;

    @:go.native("GetMouseY")
    public static extern function GetMouseY(): Int;

    @:go.native("GetFrameTime")
    public static extern function GetFrameTime(): Float;
}

@:dce(ignore)
@:analyzer(ignore)
class Test {
    public static function main() {
        Raylib.InitWindow(800, 400, "raylib [core] example - basic window");

        var target_x = Convert.float32(0.0);
        var target_y = Convert.float32(0.0);
        var vel_x = Convert.float32(0.0);
        var vel_y = Convert.float32(0.0);
        var current_x = Convert.float32(0.0);
        var current_y = Convert.float32(0.0);

        final stiffness = Convert.float32(10.0);
        final damping = Convert.float32(2.0);

        while (!Raylib.WindowShouldClose()) {
            target_x = Convert.float32(Raylib.GetMouseX());
            target_y = Convert.float32(Raylib.GetMouseY());

            var dx = current_x - target_x;
            var dy = current_y - target_y;

            var fx = -stiffness * dx;
            var fy = -stiffness * dy;

            var dmx = -damping * vel_x;
            var dmy = -damping * vel_y;

            var ax = fx + dmx;
            var ay = fy + dmy;

            var dt = Raylib.GetFrameTime();
            vel_x += ax * dt;
            vel_y += ay * dt;

            current_x += vel_x * dt;
            current_y += vel_y * dt;

            Raylib.BeginDrawing();
            Raylib.ClearBackground(Raylib.White);

            Raylib.DrawCircle(Convert.int32(target_x), Convert.int32(target_y), 20.0, Raylib.DarkGreen);
            Raylib.DrawCircle(Convert.int32(current_x), Convert.int32(current_y), 15.0, Raylib.Lime);

            Raylib.EndDrawing();
        }

        Raylib.CloseWindow();

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
