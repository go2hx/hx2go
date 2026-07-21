package go.unicode;

@:structInit
@:go.Type({ name: "foldPair", instanceName: "unicode.foldPair", imports: ["unicode"] })
extern class FoldPair {

    @:native("From") var _from: go.UInt16;
    @:native("To") var _to: go.UInt16;

    function new(_from: go.UInt16, _to: go.UInt16);

}