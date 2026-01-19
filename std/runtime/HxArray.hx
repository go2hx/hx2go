package runtime;

import go.Syntax;
import go.Slice;
import go.GoInt;
import go.Go;

// TODO: remove extern from class and functions when module resolution works correctly.
extern class HxArray {

    @:pure public inline extern static function getData<T>(arr: Array<T>): Slice<T>
        return Syntax.code('{0}.data', arr);

    public inline extern static function setData<T>(arr: Array<T>, data: Slice<T>): Void
        Syntax.code('{0}.data = {1}', arr, data);

    public inline extern static function push<T>(arr: Array<T>, value: T): GoInt {
        var data = getData(arr);
        setData(arr, Go.append(data, value));

        return Go.len(data);
    }

}
