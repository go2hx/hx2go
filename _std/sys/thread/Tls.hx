package sys.thread;

import go.sync.Mutex;

@:noPackageRestrict
class Tls<T> {

    private var _mutex: Mutex;
    private var _values: Map<Int, Null<T>>;

    public var value(get, set): Null<T>;

    public function new(): Void {
        _values = [];
    }

    function get_value() {
        var id = @:privateAccess ThreadImpl.getGoroutineId();

        _mutex.lock();
        var v = _values[id];
        _mutex.unlock();

        return v;
    }

    function set_value(v:Null<T>) {
        var id = @:privateAccess ThreadImpl.getGoroutineId();

        _mutex.lock();
        var _v = _values[id] = v;
        _mutex.unlock();

        return _v;
    }
}
