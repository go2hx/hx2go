package go.reflect;

@:structInit
@:go.Type({ name: "MapIter", instanceName: "reflect.MapIter", imports: ["reflect"] })
extern class MapIter {

    @:native("Key") function key(): (go.reflect.Value);
    @:native("Next") function next(): (Bool);
    @:native("Reset") function reset(v: go.reflect.Value): Void;
    @:native("Value") function value(): (go.reflect.Value);

}