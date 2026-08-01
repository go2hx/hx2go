package go.net.http.pprof;

@:structInit
@:go.Type({ name: "profileEntry", instanceName: "pprof.profileEntry", imports: ["net/http/pprof"] })
extern class ProfileEntry {

    @:native("Name") var name: String;
    @:native("Href") var href: String;
    @:native("Desc") var desc: String;
    @:native("Count") var count: go.GoInt;

    function new(name: String, href: String, desc: String, count: go.GoInt);

}