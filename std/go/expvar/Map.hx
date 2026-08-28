package go.expvar;

@:structInit
@:go.Type({ name: "Map", instanceName: "expvar.Map", imports: ["expvar"] })
extern class Map {

    @:native("Add") function add(key: std.String, delta: go.Int64): Void;
    @:native("AddFloat") function addFloat(key: std.String, delta: Float): Void;
    @:native("Delete") function delete(key: std.String): Void;
    @:native("Do") function _do(f: (p0: go.expvar.KeyValue) -> Void): Void;
    @:native("Get") function get(key: std.String): (go.expvar.Var);
    @:native("Init") function init(): (go.Pointer<go.expvar.Map>);
    @:native("Set") function set(key: std.String, av: go.expvar.Var): Void;
    @:native("String") function string(): (std.String);

}