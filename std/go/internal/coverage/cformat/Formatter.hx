package go.internal.coverage.cformat;

@:structInit
@:go.Type({ name: "Formatter", instanceName: "cformat.Formatter", imports: ["internal/coverage/cformat"] })
extern class Formatter {

    @:native("AddUnit") function addUnit(file: String, fname: String, isfnlit: Bool, unit: go.internal.coverage.CoverableUnit, count: go.UInt32): Void;
    @:native("EmitFuncs") function emitFuncs(w: go.io.Writer): go.Error;
    @:native("EmitPercent") function emitPercent(w: go.io.Writer, pkgs: go.Slice<String>, inpkgs: String, noteEmpty: Bool, aggregate: Bool): go.Error;
    @:native("EmitTextual") function emitTextual(pkgs: go.Slice<String>, w: go.io.Writer): go.Error;
    @:native("SetPackage") function setPackage(importpath: String): Void;

}