package go.archive.zip;

/**
    A Compressor returns a new compressing writer, writing to w.
    The WriteCloser's Close method must be used to flush pending data to w.
    The Compressor itself must be safe to invoke from multiple goroutines
    simultaneously, but each returned writer will be used only by
    one goroutine at a time.
**/
@:go.Type({ name: "Compressor", instanceName: "zip.Compressor", imports: ["archive/zip"] })
extern class Compressor {

}