package go.internal;

@:go.Type({ name: "lazyregexp", instanceName: "lazyregexp.lazyregexp", imports: ["internal/lazyregexp"] })
extern class Lazyregexp {

    @:native("New") static function _new(str: String): go.Pointer<go.internal.lazyregexp.Regexp>;

}