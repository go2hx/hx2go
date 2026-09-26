package sys.thread;

import go.sync.Mutex;

@:noPackageRestrict
class Tls<T> {

    private var _mutex: Mutex;
    private var _values: Map<Int, T>;

    public var value(get, set): Null<T>;

    public function new(): Void {
        _values = [];
    }

    function get_value() {
        _mutex.lock();
        var v = _values[@:privateAccess ThreadImpl.getGoroutineId()];
        _mutex.unlock();

        return v;
    }

    function set_value(v:Null<T>) {
        _mutex.lock();
        var _v = _values[@:privateAccess ThreadImpl.getGoroutineId()] = v;
        _mutex.unlock();

        return _v;
    }
}
