package go.time;

@:structInit
@:go.Type({ name: "Location", instanceName: "time.Location", imports: ["time"] })
extern class Location {

    @:native("String") function string(): (String);

}