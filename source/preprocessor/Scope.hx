package preprocessor;

@:structInit
class Scope {

    public var deferred: Array<Void->Void> = [];

    public function defer(f: Void->Void): Void {
        deferred.push(f);
    }

    public function finalise(): Void {
        for (f in deferred) f();
    }

}
