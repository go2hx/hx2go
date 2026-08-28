package go.runtime.metrics;

/**
    ValueKind is a tag for a metric [Value] which indicates its type.
**/
@:go.Type({ name: "ValueKind", instanceName: "metrics.ValueKind", imports: ["runtime/metrics"] })
extern typedef ValueKind = go.GoInt