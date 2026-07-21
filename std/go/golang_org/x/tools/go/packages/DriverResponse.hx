package go.golang_org.x.tools.go.packages;

@:structInit
@:go.Type({ name: "DriverResponse", instanceName: "packages.DriverResponse", imports: ["golang.org/x/tools/go/packages"] })
extern class DriverResponse {

    @:native("NotHandled") var notHandled: Bool;
    @:native("Compiler") var compiler: String;
    @:native("Arch") var arch: String;
    @:native("Roots") var roots: go.Slice<String>;
    @:native("Packages") var packages: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>;
    @:native("GoVersion") var goVersion: go.GoInt;

    function new(notHandled: Bool, compiler: String, arch: String, roots: go.Slice<String>, packages: go.Slice<go.Pointer<go.golang_org.x.tools.go.packages.Package>>, goVersion: go.GoInt);

}