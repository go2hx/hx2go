typedef MyDyn = Dynamic;

class Main {

    public static function main(): Void {
        var test: Array<MyDyn> = [1, 2, 3];
        var test_dyn_arr: Array<MyDyn> = test;
        var test_dyn_obj: MyDyn = test;
        trace(test_dyn_arr, test_dyn_obj);

        var test_null_dyn_arr: Null<Array<MyDyn>> = test;
        var test_dyn_null_arr: Array<Null<MyDyn>> = test;
        var test_null_dyn_obj: Null<MyDyn> = test;
        trace(test_null_dyn_arr, test_dyn_null_arr, test_null_dyn_obj);
    }

}