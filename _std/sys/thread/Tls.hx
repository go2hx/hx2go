package sys.thread;

import go.sync.Mutex;
import go.sync.atomic.Int32;
import go.Runtime;
import go.Value;

@:noPackageRestrict
class Tls<T> {

    private static var _store: Map<Int, Map<Int, Dynamic>>;
    private static var _storeMutex: Mutex;
    private static var _idCounter: Int32;

    private var _id: Int;

    public var value(get, set): Null<T>;

    public function new(): Void {
        _id = _idCounter.add(1);
        Runtime.addCleanup(Value.of(this), release, _id);
    }

    function get_value(): Null<T> {
        var gid = @:privateAccess ThreadImpl.getGoroutineId();

        _storeMutex.lock();
        var local = _store?.get(gid);
        var v: Null<T> = local?.get(_id);
        _storeMutex.unlock();

        return v;
    }

    function set_value(v: Null<T>): Null<T> {
        var gid = @:privateAccess ThreadImpl.getGoroutineId();

        _storeMutex.lock();

        if (_store == null) {
            _store = [];
        }

        var local = _store[gid];
        if (local == null) {
            local = [];
            _store[gid] = local;
        }

        local[_id] = v;
        _storeMutex.unlock();

        return v;
    }

    static function release(id: Int): Void {
        _storeMutex.lock();
        if (_store != null) {
            for (local in _store) {
                local.remove(id);
            }
        }
        _storeMutex.unlock();
    }

    static function cleanup(gid: Int): Void {
        _storeMutex.lock();
        if (_store != null) {
            _store.remove(gid);
        }
        _storeMutex.unlock();
    }

}