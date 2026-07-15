package go.internal.trace.traceviewer;

@:structInit
@:go.Type({ name: "TimeHistogram", instanceName: "traceviewer.TimeHistogram", imports: ["internal/trace/traceviewer"] })
extern class TimeHistogram {

    @:native("Count") var count: go.GoInt;
    @:native("Buckets") var buckets: go.Slice<go.GoInt>;
    @:native("MinBucket") var minBucket: go.GoInt;
    @:native("MaxBucket") var maxBucket: go.GoInt;

function new(count: go.GoInt, buckets: go.Slice<go.GoInt>, minBucket: go.GoInt, maxBucket: go.GoInt);

    @:native("Add") function add(d: go.time.Duration): Void;
    @:native("BucketMin") function bucketMin(bucket: go.GoInt): go.time.Duration;
    @:native("ToHTML") function toHTML(urlmaker: (min: go.time.Duration, max: go.time.Duration) -> String): go.html.template.HTML;

}