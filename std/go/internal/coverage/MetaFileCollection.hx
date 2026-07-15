package go.internal.coverage;

@:structInit
@:go.Type({ name: "MetaFileCollection", instanceName: "coverage.MetaFileCollection", imports: ["internal/coverage"] })
extern class MetaFileCollection {

    @:native("ImportPaths") var importPaths: go.Slice<String>;
    @:native("MetaFileFragments") var metaFileFragments: go.Slice<String>;

function new(importPaths: go.Slice<String>, metaFileFragments: go.Slice<String>);

}