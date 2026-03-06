function main() {
    var x:String = "ho";
    Sys.println(x.charAt(1) + x.charCodeAt(0));
    Sys.println(x.indexOf("o"));
    Sys.println(x.split(""));
    Sys.println(String.fromCharCode(42));
    Sys.println(new String("hi"));
}

class X<T> {
    public function new() {}
    public var x:T;
}