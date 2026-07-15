package go.internal;

@:go.Type({ name: "fmtsort", instanceName: "fmtsort.fmtsort", imports: ["internal/fmtsort"] })
extern class Fmtsort {

    @:native("Sort") static function sort(mapValue: go.reflect.Value): go.internal.fmtsort.SortedMap;

}