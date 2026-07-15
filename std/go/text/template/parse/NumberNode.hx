package go.text.template.parse;

@:structInit
@:go.Type({ name: "NumberNode", instanceName: "parse.NumberNode", imports: ["text/template/parse"] })
extern class NumberNode {

    @:native("NodeType") var nodeType: go.text.template.parse.NodeType;
    @:native("Pos") var pos: go.text.template.parse.Pos;
    @:native("IsInt") var isInt: Bool;
    @:native("IsUint") var isUint: Bool;
    @:native("IsFloat") var isFloat: Bool;
    @:native("IsComplex") var isComplex: Bool;
    @:native("Int64") var int64: go.Int64;
    @:native("Uint64") var uint64: go.UInt64;
    @:native("Float64") var float64: Float;
    @:native("Complex128") var complex128: go.Complex128;
    @:native("Text") var text: String;

function new(nodeType: go.text.template.parse.NodeType, pos: go.text.template.parse.Pos, isInt: Bool, isUint: Bool, isFloat: Bool, isComplex: Bool, int64: go.Int64, uint64: go.UInt64, float64: Float, complex128: go.Complex128, text: String);

    @:native("Copy") function copy(): go.text.template.parse.Node;
    @:native("Position") function position(): go.text.template.parse.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.text.template.parse.NodeType;

}