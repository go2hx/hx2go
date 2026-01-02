class Sys {
    public static function println(s:Dynamic)
        go.Syntax.code("println({0})", s);
    public static function print(s:Dynamic)
        go.Syntax.code("print({0})", s);
}