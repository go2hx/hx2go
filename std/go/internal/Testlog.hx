package go.internal;

@:go.Type({ name: "testlog", instanceName: "testlog.testlog", imports: ["internal/testlog"] })
extern class Testlog {

    @:native("Getenv") static function getenv(name: String): Void;
    @:native("Logger") static function logger(): go.internal.testlog.Interface;
    @:native("Open") static function open(name: String): Void;
    @:native("PanicOnExit0") static function panicOnExit0(): Bool;
    @:native("SetLogger") static function setLogger(impl: go.internal.testlog.Interface): Void;
    @:native("SetPanicOnExit0") static function setPanicOnExit0(v: Bool): Void;
    @:native("Stat") static function stat(name: String): Void;

}