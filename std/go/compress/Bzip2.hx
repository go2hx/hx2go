package go.compress;

/**
    Package bzip2 implements bzip2 decompression.
**/
@:go.Type({ name: "bzip2", instanceName: "bzip2.bzip2", imports: ["compress/bzip2"] })
extern class Bzip2 {

    /**
        NewReader returns an [io.Reader] which decompresses bzip2 data from r.
        If r does not also implement [io.ByteReader],
        the decompressor may read more data than necessary from r.
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.io.Reader);

}