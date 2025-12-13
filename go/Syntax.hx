package go;

extern class Syntax {
    // public static extern function defer<T>(fn: Void->Void): T;
    public static extern function code<T>(code: String, args: haxe.Rest<Dynamic>): T;
}
