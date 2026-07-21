package haxe;

import haxe.iterators.RestIterator;
import haxe.iterators.RestKeyValueIterator;
import go.Slice;
import go.haxe.HxDynamic;

private typedef NativeRest<T> = Dynamic;

@:coreApi
abstract Rest<T>(NativeRest<T>) {
    public var length(get,never):Int;

    inline function get_length(): Int
        return this.length;

    @:from static public inline function of<T>(array: Array<T>): Rest<T>
        return new Rest(array);

    inline function new(array:Array<T>):Void
        this = array;

    @:arrayAccess inline function get(index:Int):T
        return this[index];

    @:to public #if !cppia inline #end function toArray(): Array<T> {
        var slice = HxDynamic.toAnySlice(this);
        return cast slice.toArray();
    }

    public inline function iterator(): RestIterator<T>
        return new RestIterator<T>(this);

    public inline function keyValueIterator(): RestKeyValueIterator<T>
        return new RestKeyValueIterator<T>(this);

    public function append(item:T):Rest<T> {
        var result = toArray();
        result.push(item);

        return new Rest(result);
    }

    public function prepend(item:T):Rest<T> {
        var result = toArray();
        result.unshift(item);

        return new Rest(result);
    }

    public inline function toString():String {
        return Std.string(this);
    }

}