import go.Go;
import go.Float32;
/**
	Single-precision IEEE 32bit float (4-byte).
**/
@:coreType @:notNull @:runtimeValue abstract Single {

    @:from
    private static function fromFloat(v: Float): Single {
        return untyped Go.float32(v);
    }

    @:from
    private static function fromFloat32(v: Float32): Single {
        return untyped v;
    }

    @:to
    private function toFloat(): Float {
        return untyped Go.float64(this);
    }

    @:to
    private function toFloat32(): Float32 {
        return untyped this;
    }

    @:to
    private function toInt(): Int {
        return untyped Go.int32(this);
    }

}