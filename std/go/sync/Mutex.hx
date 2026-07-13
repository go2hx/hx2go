package go.sync;


@:go.Type({name: "sync.Mutex", imports: ["sync"]})
extern class Mutex {
    function lock(): Void;
    function tryLock(): Bool;
    function unlock(): Void;
}