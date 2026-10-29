package go.golang_org.x.tools.go.packages;

@:go.Type({ name: "driver", instanceName: "packages.driver", imports: ["golang.org/x/tools/go/packages"] })
extern typedef Driver = (cfg: go.Pointer<go.golang_org.x.tools.go.packages.Config>, patterns: go.Slice<String>) -> (go.Result<go.Pointer<go.golang_org.x.tools.go.packages.DriverResponse>>)