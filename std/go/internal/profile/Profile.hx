package go.internal.profile;

@:structInit
@:go.Type({ name: "Profile", instanceName: "profile.Profile", imports: ["internal/profile"] })
extern class Profile {

    @:native("SampleType") var sampleType: go.Slice<go.Pointer<go.internal.profile.ValueType>>;
    @:native("DefaultSampleType") var defaultSampleType: String;
    @:native("Sample") var sample: go.Slice<go.Pointer<go.internal.profile.Sample>>;
    @:native("Mapping") var mapping: go.Slice<go.Pointer<go.internal.profile.Mapping>>;
    @:native("Location") var location: go.Slice<go.Pointer<go.internal.profile.Location>>;
    @:native("Function") var _function: go.Slice<go.Pointer<go.internal.profile.Function>>;
    @:native("Comments") var comments: go.Slice<String>;
    @:native("DropFrames") var dropFrames: String;
    @:native("KeepFrames") var keepFrames: String;
    @:native("TimeNanos") var timeNanos: go.Int64;
    @:native("DurationNanos") var durationNanos: go.Int64;
    @:native("PeriodType") var periodType: go.Pointer<go.internal.profile.ValueType>;
    @:native("Period") var period: go.Int64;

function new(sampleType: go.Slice<go.Pointer<go.internal.profile.ValueType>>, defaultSampleType: String, sample: go.Slice<go.Pointer<go.internal.profile.Sample>>, mapping: go.Slice<go.Pointer<go.internal.profile.Mapping>>, location: go.Slice<go.Pointer<go.internal.profile.Location>>, _function: go.Slice<go.Pointer<go.internal.profile.Function>>, comments: go.Slice<String>, dropFrames: String, keepFrames: String, timeNanos: go.Int64, durationNanos: go.Int64, periodType: go.Pointer<go.internal.profile.ValueType>, period: go.Int64);

    @:native("Aggregate") function aggregate(inlineFrame: Bool, _function: Bool, filename: Bool, linenumber: Bool, address: Bool): go.Error;
    @:native("CheckValid") function checkValid(): go.Error;
    @:native("Compatible") function compatible(pb: go.Pointer<go.internal.profile.Profile>): go.Error;
    @:native("Copy") function copy(): go.Pointer<go.internal.profile.Profile>;
    @:native("Demangle") function demangle(d: go.internal.profile.Demangler): go.Error;
    @:native("Empty") function empty(): Bool;
    @:go.Tuple("fm", "im") @:native("FilterSamplesByTag") function filterSamplesByTag(focus: go.internal.profile.TagMatch, ignore: go.internal.profile.TagMatch): go.Tuple<{ fm: Bool, im: Bool }>;
    @:native("HasFileLines") function hasFileLines(): Bool;
    @:native("HasFunctions") function hasFunctions(): Bool;
    @:native("Merge") function merge(pb: go.Pointer<go.internal.profile.Profile>, r: Float): go.Error;
    @:native("Normalize") function normalize(pb: go.Pointer<go.internal.profile.Profile>): go.Error;
    @:native("Prune") function prune(dropRx: go.Pointer<go.regexp.Regexp>, keepRx: go.Pointer<go.regexp.Regexp>): Void;
    @:native("RemoveUninteresting") function removeUninteresting(): go.Error;
    @:native("Scale") function scale(ratio: Float): Void;
    @:native("ScaleN") function scaleN(ratios: go.Slice<Float>): go.Error;
    @:native("String") function string(): String;
    @:native("Write") function write(w: go.io.Writer): go.Error;

}