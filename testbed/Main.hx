import haxe.GcFinalizer;
import go.Runtime;

function main() {
    var v = new GcFinalizer((v: String) -> {
        trace("finalizer value is", v);
    });

    var obj = { id: 1 };
    var handle = v.register(obj, "obj id 1");

    trace(obj);
    Runtime.GC();

    var obj2 = { id : 2 };
    var handle2 = v.register(obj2, "obj id 2");

    trace(obj2);
    Runtime.GC();

    var obj3 = { id : 3 };
    var handle3 = v.register(obj3, "obj id 3 (should not show up)");

    trace(obj3);
    handle3.close();
    Runtime.GC();

    trace("done");
}