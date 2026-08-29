package go.expvar;

/**
    Map is a string-to-Var map variable that satisfies the [Var] interface.
**/
@:structInit
@:go.Type({ name: "Map", instanceName: "expvar.Map", imports: ["expvar"] })
extern class Map {

    /**
        Add adds delta to the *[Int] value stored under the given map key.
    **/
    @:native("Add") function add(key: std.String, delta: go.Int64): Void;
    /**
        AddFloat adds delta to the *[Float] value stored under the given map key.
    **/
    @:native("AddFloat") function addFloat(key: std.String, delta: Float): Void;
    /**
        Delete deletes the given key from the map.
    **/
    @:native("Delete") function delete(key: std.String): Void;
    /**
        Do calls f for each entry in the map.
        The map is locked during the iteration,
        but existing entries may be concurrently updated.
    **/
    @:native("Do") function _do(f: (p0: go.expvar.KeyValue) -> Void): Void;
    @:native("Get") function get(key: std.String): (go.expvar.Var);
    /**
        Init removes all keys from the map.
    **/
    @:native("Init") function init(): (go.Pointer<go.expvar.Map>);
    @:native("Set") function set(key: std.String, av: go.expvar.Var): Void;
    @:native("String") function string(): (std.String);

}