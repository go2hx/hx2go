package go.compress;

@:go.Type({ name: "bzip2", instanceName: "bzip2.bzip2", imports: ["compress/bzip2"] })
extern class Bzip2 {

    @:native("NewReader") static function newReader(r: go.io.Reader): go.io.Reader;

}