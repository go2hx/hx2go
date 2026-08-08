package haxe;

import sys.thread.Mutex;
import go.Runtime;
import go.Syntax;
import go.haxe.HxDynamic;
import go.reflect.Value;
import go.Pointer;
import go.Byte;

private class GcFinalizerState<T> {

    public var mutex: Mutex = new Mutex();
    public var active: Bool = true;
    public var callback: Null<T->Void>;
    public var held: Null<T>;

    public function new(callback: T->Void, held: T) {
        this.callback = callback;
        this.held = held;
    }

}

private class GcFinalizerHandle<T> implements IHandle {

    public var closeCallback: Null<Void->Void>;

    public function new(closeCallback: Void->Void) {
        this.closeCallback = closeCallback;
    }

    public function close(): Void {
        if (closeCallback == null) {
            return;
        }

        closeCallback();
        closeCallback = null;
    }

}

@:go.Type({ name: "unsafe", imports: ["unsafe"] })
private extern class Unsafe {
    static function pointer(v: Dynamic): UnsafePtr;
}

@:go.Type({ name: "unsafe.Pointer", imports: ["unsafe"] })
private extern class UnsafePtr {}

class GcFinalizer<T> {

    private var _callback: T->Void;

    public function new(callback:T->Void) {
        _callback = callback;
    }

    private function makePtr(v: Value) {
        return Unsafe.pointer(v.pointer());
    }

    public function register(target:{}, heldValue:T): IHandle {
        var state = new GcFinalizerState(_callback, heldValue);
        var value = HxDynamic.ensureValue(target);
        var iface: Dynamic = null;
        var isPtr: Bool = false;

        var finalizer = () -> {
            state.mutex.acquire();

            if (!state.active) {
                state.mutex.release();
                return;
            }

            state.active = false;

            var cb = state.callback;
            var value = state.held;

            state.callback = null;
            state.held = null;
            state.mutex.release();

            cb(value);
        };

        Syntax.code("
            switch {0}.Kind() {
                case reflect.Map, reflect.Slice:
                    {1} = (*byte)(this.Hx_Field_makePtr({0}))
                    {2} = true
                default:
                    {1} = {0}.Interface()
                    {2} = false
            }
        ", value, iface, isPtr);

        if (isPtr) Runtime.setFinalizer(Syntax.code("{0}.(*byte)", iface), (v: Pointer<Byte>) -> finalizer());
        else Runtime.setFinalizer((iface : Dynamic), (v: Dynamic) -> finalizer());

        return new GcFinalizerHandle(() -> {
            state.mutex.acquire();
            state.active = false;
            state.callback = null;
            state.held = null;
            state.mutex.release();
        });
    }

}