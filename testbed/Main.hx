function main() {
    var arr: Array<String> = ['a', 'b', 'c'];
    trace(arr[0]);
    arr[0] = 'hello';

    var arr_dyn_t: Array<Dynamic> = arr;
    trace(arr_dyn_t[1]);
    arr_dyn_t[1] = 'world';

    var arr_dyn_s: Dynamic = arr;
    trace(arr_dyn_s[2]);
    arr_dyn_s[2] = '!';

    trace(arr, arr_dyn_t, arr_dyn_s);
}