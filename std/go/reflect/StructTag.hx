package go.reflect;

@:go.Type({ name: "StructTag", instanceName: "Reflect.structTag", imports: ["reflect"] })
extern typedef StructTag = haxe.extern.EitherType<String, {
    @:native("Get") function get(key: String): (String);
    @:go.Tuple("value", "ok") @:native("Lookup") function lookup(key: String): (go.Tuple<{ value: String, ok: Bool }>);

}>