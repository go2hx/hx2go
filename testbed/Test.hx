class Test {
    public static function main() {
        var x = {
            x: foo(),
            y: 0.2,
        };
        change(x);

        Sys.println(x.x);
    }

    public static function change(x:{x:Int, y:Float}) {
        x.x = 10;
    }

    public static function foo():Int
        return 10;
}