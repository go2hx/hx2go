package go.internal.coverage;

@:go.Type({ name: "cfile", instanceName: "cfile.cfile", imports: ["internal/coverage/cfile"] })
extern class Cfile {

    @:native("ClearCounters") static function clearCounters(): go.Error;
    @:native("InitHook") static function initHook(istest: Bool): Void;
    @:native("MarkProfileEmitted") static function markProfileEmitted(val: Bool): Void;
    @:native("ProcessCoverTestDir") static function processCoverTestDir(dir: String, cfile: String, cm: String, cpkg: String, w: go.io.Writer, selpkgs: go.Slice<String>): go.Error;
    @:native("Snapshot") static function snapshot(): Float;
    @:native("WriteCounters") static function writeCounters(w: go.io.Writer): go.Error;
    @:native("WriteCountersDir") static function writeCountersDir(dir: String): go.Error;
    @:native("WriteMeta") static function writeMeta(w: go.io.Writer): go.Error;
    @:native("WriteMetaDir") static function writeMetaDir(dir: String): go.Error;

}