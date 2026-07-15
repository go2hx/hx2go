package go.internal;

@:go.Type({ name: "coverage", instanceName: "coverage.coverage", imports: ["internal/coverage"] })
extern class Coverage {

    @:native("CounterFilePref") static var CounterFilePref: String;
    @:native("CounterFileRegexp") static var CounterFileRegexp: String;
    @:native("CounterFileTempl") static var CounterFileTempl: String;
    @:native("CounterFileVersion") static var CounterFileVersion: go.GoInt;
    @:native("CovMetaHeaderSize") static var CovMetaHeaderSize: go.GoInt;
    @:native("CtrGranularityInvalid") static var CtrGranularityInvalid: go.internal.coverage.CounterGranularity;
    @:native("CtrGranularityPerBlock") static var CtrGranularityPerBlock: go.internal.coverage.CounterGranularity;
    @:native("CtrGranularityPerFunc") static var CtrGranularityPerFunc: go.internal.coverage.CounterGranularity;
    @:native("CtrModeAtomic") static var CtrModeAtomic: go.internal.coverage.CounterMode;
    @:native("CtrModeCount") static var CtrModeCount: go.internal.coverage.CounterMode;
    @:native("CtrModeInvalid") static var CtrModeInvalid: go.internal.coverage.CounterMode;
    @:native("CtrModeRegOnly") static var CtrModeRegOnly: go.internal.coverage.CounterMode;
    @:native("CtrModeSet") static var CtrModeSet: go.internal.coverage.CounterMode;
    @:native("CtrModeTestMain") static var CtrModeTestMain: go.internal.coverage.CounterMode;
    @:native("CtrRaw") static var CtrRaw: go.internal.coverage.CounterFlavor;
    @:native("CtrULeb128") static var CtrULeb128: go.internal.coverage.CounterFlavor;
    @:native("FirstCtrOffset") static var FirstCtrOffset: go.GoInt;
    @:native("FuncIdOffset") static var FuncIdOffset: go.GoInt;
    @:native("MetaFilePref") static var MetaFilePref: String;
    @:native("MetaFileVersion") static var MetaFileVersion: go.GoInt;
    @:native("MetaFilesFileName") static var MetaFilesFileName: String;
    @:native("NotHardCoded") static var NotHardCoded: go.GoInt;
    @:native("NumCtrsOffset") static var NumCtrsOffset: go.GoInt;
    @:native("PkgIdOffset") static var PkgIdOffset: go.GoInt;

    @:native("CovCounterMagic") static var CovCounterMagic: go.GoArray<go.Byte, 4>;
    @:native("CovMetaMagic") static var CovMetaMagic: go.GoArray<go.Byte, 4>;

    @:native("HardCodedPkgID") static function hardCodedPkgID(pkgpath: String): go.GoInt;
    @:native("ParseCounterMode") static function parseCounterMode(mode: String): go.internal.coverage.CounterMode;
    @:native("Round4") static function round4(x: go.GoInt): go.GoInt;

}