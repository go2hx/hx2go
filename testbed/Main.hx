class Main {

    public static function main() {
        var obj = {
            int: 1,
            float: 2.3,
            string: "Hello",
            bool: false,
            nest: {
                int_nested: 5,
                bool_nested: true
            }
        };

        Sys.println(obj);
        Sys.println(obj.int);
        Sys.println(obj.string);
        Sys.println(obj.bool);
        Sys.println(obj.nest);
        Sys.println(obj.nest.int_nested);
        Sys.println(obj.nest.bool_nested);

        var x = 3 + "Hello";
//
//        var as_dyn: Dynamic = obj;
//        Sys.println(obj);
//        Sys.println(as_dyn.int);
//        Sys.println(as_dyn.string);
//        Sys.println(as_dyn.bool);
//        Sys.println(as_dyn.nest);
//        Sys.println(as_dyn.nest.int_nested);
//        Sys.println(as_dyn.nest.bool_nested);
    }

}