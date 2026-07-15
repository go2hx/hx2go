package go.encoding;

@:go.Type({ name: "gob", instanceName: "gob.gob", imports: ["encoding/gob"] })
extern class Gob {

    @:native("NewDecoder") static function newDecoder(r: go.io.Reader): go.Pointer<go.encoding.gob.Decoder>;
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): go.Pointer<go.encoding.gob.Encoder>;
    @:native("Register") static function register(value: Dynamic): Void;
    @:native("RegisterName") static function registerName(name: String, value: Dynamic): Void;

}