package go;

@:go.Type({ name: "sync", instanceName: "sync.sync", imports: ["sync"] })
extern class Sync {

    @:native("NewCond") static function newCond(l: go.sync.Locker): go.Pointer<go.sync.Cond>;
    @:native("OnceFunc") static function onceFunc(f: () -> Void): () -> Void;
    @:native("OnceValue") static function onceValue<T: Dynamic>(f: () -> T): () -> T;
    @:native("OnceValues") static function onceValues<T1: Dynamic, T2: Dynamic>(f: () -> go.Tuple<{ p0: T1, p1: T2 }>): () -> go.Tuple<{ p0: T1, p1: T2 }>;

}