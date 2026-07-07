abstract Foo(Int) from Int {

    public function log(): Void {
        trace('foo logged', this);
    }

}

class Main {

   public static function main(): Void {
       var x: Int = 5;
       var y: Foo = x;
       y.log();
   }

}