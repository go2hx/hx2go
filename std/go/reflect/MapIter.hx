package go.reflect;

/**
    A MapIter is an iterator for ranging over a map.
    See [Value.MapRange].
**/
@:structInit
@:go.Type({ name: "MapIter", instanceName: "reflect.MapIter", imports: ["reflect"] })
extern class MapIter {

    /**
        Key returns the key of iter's current map entry.
    **/
    @:native("Key") function key(): (go.reflect.Value);
    /**
        Next advances the map iterator and reports whether there is another
        entry. It returns false when iter is exhausted; subsequent
        calls to [MapIter.Key], [MapIter.Value], or [MapIter.Next] will panic.
    **/
    @:native("Next") function next(): (Bool);
    /**
        Reset modifies iter to iterate over v.
        It panics if v's Kind is not [Map] and v is not the zero Value.
        Reset(Value{}) causes iter to not to refer to any map,
        which may allow the previously iterated-over map to be garbage collected.
    **/
    @:native("Reset") function reset(v: go.reflect.Value): Void;
    /**
        Value returns the value of iter's current map entry.
    **/
    @:native("Value") function value(): (go.reflect.Value);

}