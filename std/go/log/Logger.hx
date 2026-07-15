package go.log;

@:structInit
@:go.Type({ name: "Logger", instanceName: "log.Logger", imports: ["log"] })
extern class Logger {

    @:native("Fatal") function fatal(v: haxe.Rest<Dynamic>): Void;
    @:native("Fatalf") function fatalf(format: String, v: haxe.Rest<Dynamic>): Void;
    @:native("Fatalln") function fatalln(v: haxe.Rest<Dynamic>): Void;
    @:native("Flags") function flags(): go.GoInt;
    @:native("Output") function output(calldepth: go.GoInt, s: String): go.Error;
    @:native("Panic") function panic(v: haxe.Rest<Dynamic>): Void;
    @:native("Panicf") function panicf(format: String, v: haxe.Rest<Dynamic>): Void;
    @:native("Panicln") function panicln(v: haxe.Rest<Dynamic>): Void;
    @:native("Prefix") function prefix(): String;
    @:native("Print") function print(v: haxe.Rest<Dynamic>): Void;
    @:native("Printf") function printf(format: String, v: haxe.Rest<Dynamic>): Void;
    @:native("Println") function println(v: haxe.Rest<Dynamic>): Void;
    @:native("SetFlags") function setFlags(flag: go.GoInt): Void;
    @:native("SetOutput") function setOutput(w: go.io.Writer): Void;
    @:native("SetPrefix") function setPrefix(prefix: String): Void;
    @:native("Writer") function writer(): go.io.Writer;

}