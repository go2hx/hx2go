package go.runtime.trace;

/**
    Region is a region of code whose execution time interval is traced.
**/
@:structInit
@:go.Type({ name: "Region", instanceName: "trace.Region", imports: ["runtime/trace"] })
extern class Region {

    /**
        End marks the end of the traced code region.
    **/
    @:native("End") function end(): Void;

}