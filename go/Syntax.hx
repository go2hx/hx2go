package go;

extern class Syntax {
    public static extern function expr<T>(code: String, args: haxe.Rest<Dynamic>): T;
    public static extern function stmt<T>(code: String, args: haxe.Rest<Dynamic>): T;
}
