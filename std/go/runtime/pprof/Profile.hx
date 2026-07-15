package go.runtime.pprof;

@:structInit
@:go.Type({ name: "Profile", instanceName: "pprof.Profile", imports: ["runtime/pprof"] })
extern class Profile {

    @:native("Add") function add(value: Dynamic, skip: go.GoInt): Void;
    @:native("Count") function count(): go.GoInt;
    @:native("Name") function name(): String;
    @:native("Remove") function remove(value: Dynamic): Void;
    @:native("WriteTo") function writeTo(w: go.io.Writer, debug: go.GoInt): go.Error;

}