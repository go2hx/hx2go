package go.runtime.trace;

@:structInit
@:go.Type({ name: "Region", instanceName: "trace.Region", imports: ["runtime/trace"] })
extern class Region {

    @:native("End") function end(): Void;

}