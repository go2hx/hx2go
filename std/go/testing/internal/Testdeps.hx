package go.testing.internal;

@:go.Type({ name: "testdeps", instanceName: "testdeps.testdeps", imports: ["testing/internal/testdeps"] })
extern class Testdeps {

    @:native("Cover") static var Cover: Bool;
    @:native("CoverMarkProfileEmittedFunc") static var CoverMarkProfileEmittedFunc: (val: Bool) -> Void;
    @:native("CoverMode") static var CoverMode: String;
    @:native("CoverProcessTestDirFunc") static var CoverProcessTestDirFunc: (dir: String, cfile: String, cm: String, cpkg: String, w: go.io.Writer, selpkgs: go.Slice<String>) -> go.Error;
    @:native("CoverSelectedPackages") static var CoverSelectedPackages: go.Slice<String>;
    @:native("CoverSnapshotFunc") static var CoverSnapshotFunc: () -> Float;
    @:native("Covered") static var Covered: String;
    @:native("ImportPath") static var ImportPath: String;
    @:native("ModulePath") static var ModulePath: String;

}