package go.archive.zip;

/**
    A Decompressor returns a new decompressing reader, reading from r.
    The [io.ReadCloser]'s Close method must be used to release associated resources.
    The Decompressor itself must be safe to invoke from multiple goroutines
    simultaneously, but each returned reader will be used only by
    one goroutine at a time.
**/
@:go.Type({ name: "Decompressor", instanceName: "zip.Decompressor", imports: ["archive/zip"] })
extern class Decompressor {

}