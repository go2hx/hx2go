function main() {
    var v: String = "Hello, World!";
    var v_null: Null<String> = v;
    var l = v_null.length;

    trace(v.length, v_null.length);
}