package unit;


function main() {
     var test: Array<Int> = [1, 2, 3];
     var test_dyn_arr: Array<Dynamic> = test;
     var test_dyn_obj: Dynamic = test;

     assert(test[0] == 1);
     assert(test.length == 3);
     assert(test_dyn_arr[0] == 1);
     assert(test_dyn_arr.length == 3);
     assert(test_dyn_obj[0] == 1);
     assert(test_dyn_obj.length == 3);
}
