package go;

@:go.Type({ name: "expvar", instanceName: "expvar.expvar", imports: ["expvar"] })
extern class Expvar {

    @:native("Do") static function _do(f: (p0: go.expvar.KeyValue) -> Void): Void;
    @:native("Get") static function get(name: String): go.expvar.Var;
    @:native("Handler") static function handler(): go.net.http.Handler;
    @:native("NewFloat") static function newFloat(name: String): go.Pointer<go.expvar.Float>;
    @:native("NewInt") static function newInt(name: String): go.Pointer<go.expvar.Int>;
    @:native("NewMap") static function newMap(name: String): go.Pointer<go.expvar.Map>;
    @:native("NewString") static function newString(name: String): go.Pointer<go.expvar.String>;
    @:native("Publish") static function publish(name: String, v: go.expvar.Var): Void;

}