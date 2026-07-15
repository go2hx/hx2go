package go.internal;

@:go.Type({ name: "lazytemplate", instanceName: "lazytemplate.lazytemplate", imports: ["internal/lazytemplate"] })
extern class Lazytemplate {

    @:native("New") static function _new(name: String, text: String): go.Pointer<go.internal.lazytemplate.Template>;

}