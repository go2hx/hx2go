import go.fmt.Fmt;

function main() {
    var arr: Array<Int> = [1, 2, 3];
    var arr_dyn: Dynamic = arr;

    trace(arr_dyn);
    arr_dyn.length();
    trace(arr_dyn);
}