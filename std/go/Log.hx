package go;

@:go.Type({ name: "log", instanceName: "log.log", imports: ["log"] })
extern class Log {

    @:native("LUTC") static var LUTC: go.GoInt;
    @:native("Ldate") static var Ldate: go.GoInt;
    @:native("Llongfile") static var Llongfile: go.GoInt;
    @:native("Lmicroseconds") static var Lmicroseconds: go.GoInt;
    @:native("Lmsgprefix") static var Lmsgprefix: go.GoInt;
    @:native("Lshortfile") static var Lshortfile: go.GoInt;
    @:native("LstdFlags") static var LstdFlags: go.GoInt;
    @:native("Ltime") static var Ltime: go.GoInt;

    @:native("Default") static function _default(): go.Pointer<go.log.Logger>;
    @:native("Fatal") static function fatal(v: haxe.Rest<Dynamic>): Void;
    @:native("Fatalf") static function fatalf(format: String, v: haxe.Rest<Dynamic>): Void;
    @:native("Fatalln") static function fatalln(v: haxe.Rest<Dynamic>): Void;
    @:native("Flags") static function flags(): go.GoInt;
    @:native("New") static function _new(out: go.io.Writer, prefix: String, flag: go.GoInt): go.Pointer<go.log.Logger>;
    @:native("Output") static function output(calldepth: go.GoInt, s: String): go.Error;
    @:native("Panic") static function panic(v: haxe.Rest<Dynamic>): Void;
    @:native("Panicf") static function panicf(format: String, v: haxe.Rest<Dynamic>): Void;
    @:native("Panicln") static function panicln(v: haxe.Rest<Dynamic>): Void;
    @:native("Prefix") static function prefix(): String;
    @:native("Print") static function print(v: haxe.Rest<Dynamic>): Void;
    @:native("Printf") static function printf(format: String, v: haxe.Rest<Dynamic>): Void;
    @:native("Println") static function println(v: haxe.Rest<Dynamic>): Void;
    @:native("SetFlags") static function setFlags(flag: go.GoInt): Void;
    @:native("SetOutput") static function setOutput(w: go.io.Writer): Void;
    @:native("SetPrefix") static function setPrefix(prefix: String): Void;
    @:native("Writer") static function writer(): go.io.Writer;

}