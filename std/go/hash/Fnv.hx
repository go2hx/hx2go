package go.hash;

@:go.Type({ name: "fnv", instanceName: "fnv.fnv", imports: ["hash/fnv"] })
extern class Fnv {

    @:native("New128") static function new128(): go.hash.Hash;
    @:native("New128a") static function new128a(): go.hash.Hash;
    @:native("New32") static function new32(): go.hash.Hash32;
    @:native("New32a") static function new32a(): go.hash.Hash32;
    @:native("New64") static function new64(): go.hash.Hash64;
    @:native("New64a") static function new64a(): go.hash.Hash64;

}