package go.expvar;

@:structInit
@:go.Type({ name: "Map", instanceName: "expvar.Map", imports: ["expvar"] })
extern class Map {

    @:native("Add") function add(key: String, delta: go.Int64): Void;
    @:native("AddFloat") function addFloat(key: String, delta: Float): Void;
    @:native("Delete") function delete(key: String): Void;
    @:native("Do") function _do(f: (p0: go.expvar.KeyValue) -> Void): Void;
    @:native("Get") function get(key: String): go.expvar.Var;
    @:native("Init") function init(): go.Pointer<go.expvar.Map>;
    @:native("Set") function set(key: String, av: go.expvar.Var): Void;
    @:native("String") function string(): String;

}