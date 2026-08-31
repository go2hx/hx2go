package go.runtime.metrics;

/**
    Value represents a metric value returned by the runtime.
**/
@:structInit
@:go.Type({ name: "Value", instanceName: "metrics.Value", imports: ["runtime/metrics"] })
extern class Value {

    /**
        Float64 returns the internal float64 value for the metric.
        
        If v.Kind() != KindFloat64, this method panics.
    **/
    @:native("Float64") function float64(): (Float);
    /**
        Float64Histogram returns the internal *Float64Histogram value for the metric.
        
        If v.Kind() != KindFloat64Histogram, this method panics.
    **/
    @:native("Float64Histogram") function float64Histogram(): (go.Pointer<go.runtime.metrics.Float64Histogram>);
    /**
        Kind returns the tag representing the kind of value this is.
    **/
    @:native("Kind") function kind(): (go.runtime.metrics.ValueKind);
    /**
        Uint64 returns the internal uint64 value for the metric.
        
        If v.Kind() != KindUint64, this method panics.
    **/
    @:native("Uint64") function uint64(): (go.UInt64);

}