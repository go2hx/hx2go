package go.net.http.internal;

@:go.Type({ name: "testcert", instanceName: "testcert.testcert", imports: ["net/http/internal/testcert"] })
extern class Testcert {

    @:native("LocalhostCert") static var LocalhostCert: go.Slice<go.Byte>;
    @:native("LocalhostKey") static var LocalhostKey: go.Slice<go.Byte>;

}