package go.syscall;

@:structInit
@:go.Type({ name: "mmapper", instanceName: "syscall.mmapper", imports: ["syscall"] })
extern class Mmapper {

    @:native("Mutex") var mutex: go.sync.Mutex;

    function new(mutex: go.sync.Mutex);

    @:native("Lock") function lock(): Void;
    @:native("Mmap") function mmap(fd: go.GoInt, offset: go.Int64, length: go.GoInt, prot: go.GoInt, flags: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    @:native("Munmap") function munmap(data: go.Slice<go.Byte>): (go.Error);
    @:native("TryLock") function tryLock(): (Bool);
    @:native("Unlock") function unlock(): Void;

}