package go.crypto.internal.fips140.nistec.fiat;

@:structInit
@:go.Type({ name: "P224Element", instanceName: "fiat.P224Element", imports: ["crypto/internal/fips140/nistec/fiat"] })
extern class P224Element {

    @:native("Add") function add(t1: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>, t2: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>): go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>;
    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Equal") function equal(t: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>): go.GoInt;
    @:native("Invert") function invert(x: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>): go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>;
    @:native("IsZero") function isZero(): go.GoInt;
    @:native("Mul") function mul(t1: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>, t2: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>): go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>;
    @:native("One") function one(): go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>;
    @:native("Select") function select(a: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>, b: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>, cond: go.GoInt): go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>;
    @:native("Set") function set(t: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>): go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>;
    @:native("SetBytes") function setBytes(v: go.Slice<go.Byte>): go.Result<go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>>;
    @:native("Square") function square(t: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>): go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>;
    @:native("Sub") function sub(t1: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>, t2: go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>): go.Pointer<go.crypto.internal.fips140.nistec.fiat.P224Element>;

}