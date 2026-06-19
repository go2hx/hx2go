package main

func Hx_Field_haxe__rest_rest_impl__get_length(this any) int {
    return this1.length
}

func Hx_Field_haxe__rest_rest_impl__of(array Hx_Obj_array) Hx_Obj_haxe_rest {
    return Hx_Obj_haxe_rest(array)
}

func Hx_Field_haxe__rest_rest_impl___hx_new(array Hx_Obj_array) Hx_Obj_haxe_rest {
    return Hx_Obj_haxe_rest(array)
}

func Hx_Field_haxe__rest_rest_impl__get(this any, index int) any {
    return 
}

func Hx_Field_haxe__rest_rest_impl__toArray(this any) Hx_Obj_array {
    return this1.copy()
}

func Hx_Field_haxe__rest_rest_impl__iterator(this any) Hx_Obj_haxe_iterators_restiterator {
    return 
}

func Hx_Field_haxe__rest_rest_impl__keyValueIterator(this any) Hx_Obj_haxe_iterators_restkeyvalueiterator {
    return 
}

func Hx_Field_haxe__rest_rest_impl__append(this any, item any) Hx_Obj_haxe_rest {
    var result Hx_Obj_array = this1.copy(); _ = result
    result.push(item)
    return Hx_Obj_haxe_rest(result)
}

func Hx_Field_haxe__rest_rest_impl__prepend(this any, item any) Hx_Obj_haxe_rest {
    var result Hx_Obj_array = this1.copy(); _ = result
    result.unshift(item)
    return Hx_Obj_haxe_rest(result)
}

func Hx_Field_haxe__rest_rest_impl__toString(this any) string {
    return this1.toString()
}
