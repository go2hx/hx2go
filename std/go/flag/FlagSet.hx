package go.flag;

@:structInit
@:go.Type({ name: "FlagSet", instanceName: "flag.FlagSet", imports: ["flag"] })
extern class FlagSet {

    @:native("Usage") var usage: () -> Void;

function new(usage: () -> Void);

    @:native("Arg") function arg(i: go.GoInt): String;
    @:native("Args") function args(): go.Slice<String>;
    @:native("Bool") function bool(name: String, value: Bool, usage: String): go.Pointer<Bool>;
    @:native("BoolFunc") function boolFunc(name: String, usage: String, fn: (p0: String) -> go.Error): Void;
    @:native("BoolVar") function boolVar(p: go.Pointer<Bool>, name: String, value: Bool, usage: String): Void;
    @:native("Duration") function duration(name: String, value: go.time.Duration, usage: String): go.Pointer<go.time.Duration>;
    @:native("DurationVar") function durationVar(p: go.Pointer<go.time.Duration>, name: String, value: go.time.Duration, usage: String): Void;
    @:native("ErrorHandling") function errorHandling(): go.flag.ErrorHandling;
    @:native("Float64") function float64(name: String, value: Float, usage: String): go.Pointer<Float>;
    @:native("Float64Var") function float64Var(p: go.Pointer<Float>, name: String, value: Float, usage: String): Void;
    @:native("Func") function func(name: String, usage: String, fn: (p0: String) -> go.Error): Void;
    @:native("Init") function init(name: String, errorHandling: go.flag.ErrorHandling): Void;
    @:native("Int") function int(name: String, value: go.GoInt, usage: String): go.Pointer<go.GoInt>;
    @:native("Int64") function int64(name: String, value: go.Int64, usage: String): go.Pointer<go.Int64>;
    @:native("Int64Var") function int64Var(p: go.Pointer<go.Int64>, name: String, value: go.Int64, usage: String): Void;
    @:native("IntVar") function intVar(p: go.Pointer<go.GoInt>, name: String, value: go.GoInt, usage: String): Void;
    @:native("Lookup") function lookup(name: String): go.Pointer<go.flag.Flag>;
    @:native("NArg") function nArg(): go.GoInt;
    @:native("NFlag") function nFlag(): go.GoInt;
    @:native("Name") function name(): String;
    @:native("Output") function output(): go.io.Writer;
    @:native("Parse") function parse(arguments: go.Slice<String>): go.Error;
    @:native("Parsed") function parsed(): Bool;
    @:native("PrintDefaults") function printDefaults(): Void;
    @:native("Set") function set(name: String, value: String): go.Error;
    @:native("SetOutput") function setOutput(output: go.io.Writer): Void;
    @:native("String") function string(name: String, value: String, usage: String): go.Pointer<String>;
    @:native("StringVar") function stringVar(p: go.Pointer<String>, name: String, value: String, usage: String): Void;
    @:native("TextVar") function textVar(p: go.encoding.TextUnmarshaler, name: String, value: go.encoding.TextMarshaler, usage: String): Void;
    @:native("Uint") function uint(name: String, value: go.GoUInt, usage: String): go.Pointer<go.GoUInt>;
    @:native("Uint64") function uint64(name: String, value: go.UInt64, usage: String): go.Pointer<go.UInt64>;
    @:native("Uint64Var") function uint64Var(p: go.Pointer<go.UInt64>, name: String, value: go.UInt64, usage: String): Void;
    @:native("UintVar") function uintVar(p: go.Pointer<go.GoUInt>, name: String, value: go.GoUInt, usage: String): Void;
    @:native("Var") function _var(value: go.flag.Value, name: String, usage: String): Void;
    @:native("Visit") function visit(fn: (p0: go.Pointer<go.flag.Flag>) -> Void): Void;
    @:native("VisitAll") function visitAll(fn: (p0: go.Pointer<go.flag.Flag>) -> Void): Void;

}