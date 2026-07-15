package go.runtime;

@:go.Type({ name: "coverage", instanceName: "coverage.coverage", imports: ["runtime/coverage"] })
extern class Coverage {

    @:native("ClearCounters") static function clearCounters(): go.Error;
    @:native("WriteCounters") static function writeCounters(w: go.io.Writer): go.Error;
    @:native("WriteCountersDir") static function writeCountersDir(dir: String): go.Error;
    @:native("WriteMeta") static function writeMeta(w: go.io.Writer): go.Error;
    @:native("WriteMetaDir") static function writeMetaDir(dir: String): go.Error;

}