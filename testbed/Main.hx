class Main {

    public static function max<T: Float>(a: T, b: T): T {
        return if (a > b) a else b;
    }

    public static function main() {
        trace(max(1, 3));
        trace(max(10.1, 19.5));
    }

}