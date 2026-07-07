abstract Foo(Int) from Int {

    public function log(): Void {
        trace('foo logged', this);
    }

}

abstract Bar<T>(Array<T>) from Array<T> to Array<T> {

    public function logAll(): Void {
        for (item in this) {
            trace(item);
        }
    }

    public function toArray(): Array<T> {
        return this;
    }

}

class Main {

   public static function main(): Void {
       var arr: Array<Int> = [1, 2, 3];
       var abs1: Bar<Int> = arr;
       var abs2: Bar<Foo> = abs1;
       abs2.logAll();
       var arr = abs2.toArray();
       arr[0].log();
   }

}