function main() {
   var x = new X<Int>();
   Sys.println(x.a);
}

class X<T> {
    public var a:Array<T> = [];
    public function new() {}
}