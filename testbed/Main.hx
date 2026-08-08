import go.Weak;
import go.Runtime;

function main() {
    var v: Dynamic = { id: 1 };
    var v_ptr = Weak.make(v);
    trace(v, v_ptr, v_ptr.value() == null);

    Runtime.GC();
    Sys.sleep(1);

    trace(v_ptr, v_ptr.value() == null);
}