package go.crypto.elliptic;

@:go.Type({ name: "nistPoint", instanceName: "elliptic.nistPoint", imports: ["crypto/elliptic"] })
extern typedef NistPoint = {

    @:native("Add") function add(p0: T, p1: T): (T);
    @:native("Bytes") function bytes(): (go.Slice<go.Byte>);
    @:native("Double") function double(p0: T): (T);
    @:native("ScalarBaseMult") function scalarBaseMult(p0: go.Slice<go.Byte>): (go.Result<T>);
    @:native("ScalarMult") function scalarMult(p0: T, p1: go.Slice<go.Byte>): (go.Result<T>);
    @:native("SetBytes") function setBytes(p0: go.Slice<go.Byte>): (go.Result<T>);

}