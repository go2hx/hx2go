class Main {

    public static function doStuff(a, b, ?c): Float {
        return c == null ? a + b : (a + b) * c;
    }

    public static function main() {
        trace(doStuff(10, 40));
        trace(doStuff(10, 40, 10));
    }

}