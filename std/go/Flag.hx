package go;

@:go.Type({ name: "flag", instanceName: "flag.flag", imports: ["flag"] })
extern class Flag {

    @:native("ContinueOnError") static var ContinueOnError: go.flag.ErrorHandling;
    @:native("ExitOnError") static var ExitOnError: go.flag.ErrorHandling;
    @:native("PanicOnError") static var PanicOnError: go.flag.ErrorHandling;

    @:native("CommandLine") static var CommandLine: go.Pointer<go.flag.FlagSet>;
    @:native("Usage") static var Usage: () -> Void;

    @:native("Arg") static function arg(i: go.GoInt): String;
    @:native("Args") static function args(): go.Slice<String>;
    @:native("Bool") static function bool(name: String, value: Bool, usage: String): go.Pointer<Bool>;
    @:native("BoolFunc") static function boolFunc(name: String, usage: String, fn: (p0: String) -> go.Error): Void;
    @:native("BoolVar") static function boolVar(p: go.Pointer<Bool>, name: String, value: Bool, usage: String): Void;
    @:native("Duration") static function duration(name: String, value: go.time.Duration, usage: String): go.Pointer<go.time.Duration>;
    @:native("DurationVar") static function durationVar(p: go.Pointer<go.time.Duration>, name: String, value: go.time.Duration, usage: String): Void;
    @:native("Float64") static function float64(name: String, value: Float, usage: String): go.Pointer<Float>;
    @:native("Float64Var") static function float64Var(p: go.Pointer<Float>, name: String, value: Float, usage: String): Void;
    @:native("Func") static function func(name: String, usage: String, fn: (p0: String) -> go.Error): Void;
    @:native("Int") static function int(name: String, value: go.GoInt, usage: String): go.Pointer<go.GoInt>;
    @:native("Int64") static function int64(name: String, value: go.Int64, usage: String): go.Pointer<go.Int64>;
    @:native("Int64Var") static function int64Var(p: go.Pointer<go.Int64>, name: String, value: go.Int64, usage: String): Void;
    @:native("IntVar") static function intVar(p: go.Pointer<go.GoInt>, name: String, value: go.GoInt, usage: String): Void;
    @:native("Lookup") static function lookup(name: String): go.Pointer<go.flag.Flag>;
    @:native("NArg") static function nArg(): go.GoInt;
    @:native("NFlag") static function nFlag(): go.GoInt;
    @:native("NewFlagSet") static function newFlagSet(name: String, errorHandling: go.flag.ErrorHandling): go.Pointer<go.flag.FlagSet>;
    @:native("Parse") static function parse(): Void;
    @:native("Parsed") static function parsed(): Bool;
    @:native("PrintDefaults") static function printDefaults(): Void;
    @:native("Set") static function set(name: String, value: String): go.Error;
    @:native("String") static function string(name: String, value: String, usage: String): go.Pointer<String>;
    @:native("StringVar") static function stringVar(p: go.Pointer<String>, name: String, value: String, usage: String): Void;
    @:native("TextVar") static function textVar(p: go.encoding.TextUnmarshaler, name: String, value: go.encoding.TextMarshaler, usage: String): Void;
    @:native("Uint") static function uint(name: String, value: go.GoUInt, usage: String): go.Pointer<go.GoUInt>;
    @:native("Uint64") static function uint64(name: String, value: go.UInt64, usage: String): go.Pointer<go.UInt64>;
    @:native("Uint64Var") static function uint64Var(p: go.Pointer<go.UInt64>, name: String, value: go.UInt64, usage: String): Void;
    @:native("UintVar") static function uintVar(p: go.Pointer<go.GoUInt>, name: String, value: go.GoUInt, usage: String): Void;
    @:go.Tuple("name", "usage") @:native("UnquoteUsage") static function unquoteUsage(flag: go.Pointer<go.flag.Flag>): go.Tuple<{ name: String, usage: String }>;
    @:native("Var") static function _var(value: go.flag.Value, name: String, usage: String): Void;
    @:native("Visit") static function visit(fn: (p0: go.Pointer<go.flag.Flag>) -> Void): Void;
    @:native("VisitAll") static function visitAll(fn: (p0: go.Pointer<go.flag.Flag>) -> Void): Void;

}