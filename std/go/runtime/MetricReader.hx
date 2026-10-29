package go.runtime;

@:go.Type({ name: "metricReader", instanceName: "runtime.metricReader", imports: ["runtime"] })
extern typedef MetricReader = () -> (go.UInt64)