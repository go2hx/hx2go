package go.crypto.tls;

@:go.Type({ name: "cbcMode", instanceName: "tls.cbcMode", imports: ["crypto/tls"] })
extern typedef CbcMode = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("CryptBlocks") function cryptBlocks(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;
    @:native("SetIV") function setIV(p0: go.Slice<go.Byte>): Void;

}