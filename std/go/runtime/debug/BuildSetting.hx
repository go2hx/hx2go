package go.runtime.debug;

/**
    A BuildSetting is a key-value pair describing one setting that influenced a build.
    
    Defined keys include:
    
      - -buildmode: the buildmode flag used (typically "exe")
      - -compiler: the compiler toolchain flag used (typically "gc")
      - CGO_ENABLED: the effective CGO_ENABLED environment variable
      - CGO_CFLAGS: the effective CGO_CFLAGS environment variable
      - CGO_CPPFLAGS: the effective CGO_CPPFLAGS environment variable
      - CGO_CXXFLAGS:  the effective CGO_CXXFLAGS environment variable
      - CGO_LDFLAGS: the effective CGO_LDFLAGS environment variable
      - DefaultGODEBUG: the effective GODEBUG settings
      - GOARCH: the architecture target
      - GOAMD64/GOARM/GO386/etc: the architecture feature level for GOARCH
      - GOOS: the operating system target
      - GOFIPS140: the frozen FIPS 140-3 module version, if any
      - vcs: the version control system for the source tree where the build ran
      - vcs.revision: the revision identifier for the current commit or checkout
      - vcs.time: the modification time associated with vcs.revision, in RFC3339 format
      - vcs.modified: true or false indicating whether the source tree had local modifications
**/
@:structInit
@:go.Type({ name: "BuildSetting", instanceName: "debug.BuildSetting", imports: ["runtime/debug"] })
extern class BuildSetting {

    @:native("Key") var key: String;
    @:native("Value") var value: String;

    function new(key: String="", value: String="");

}