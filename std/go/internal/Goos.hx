package go.internal;

@:go.Type({ name: "goos", instanceName: "goos.goos", imports: ["internal/goos"] })
extern class Goos {

    @:native("GOOS") static var GOOS: String;
    @:native("IsAix") static var IsAix: go.GoInt;
    @:native("IsAndroid") static var IsAndroid: go.GoInt;
    @:native("IsDarwin") static var IsDarwin: go.GoInt;
    @:native("IsDragonfly") static var IsDragonfly: go.GoInt;
    @:native("IsFreebsd") static var IsFreebsd: go.GoInt;
    @:native("IsHurd") static var IsHurd: go.GoInt;
    @:native("IsIllumos") static var IsIllumos: go.GoInt;
    @:native("IsIos") static var IsIos: go.GoInt;
    @:native("IsJs") static var IsJs: go.GoInt;
    @:native("IsLinux") static var IsLinux: go.GoInt;
    @:native("IsNacl") static var IsNacl: go.GoInt;
    @:native("IsNetbsd") static var IsNetbsd: go.GoInt;
    @:native("IsOpenbsd") static var IsOpenbsd: go.GoInt;
    @:native("IsPlan9") static var IsPlan9: go.GoInt;
    @:native("IsSolaris") static var IsSolaris: go.GoInt;
    @:native("IsUnix") static var IsUnix: Bool;
    @:native("IsWasip1") static var IsWasip1: go.GoInt;
    @:native("IsWindows") static var IsWindows: go.GoInt;
    @:native("IsZos") static var IsZos: go.GoInt;

}