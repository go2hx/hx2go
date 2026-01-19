import haxe.iterators.ArrayKeyValueIterator;
import runtime.HxArray;

@:coreType
extern class Array<T> {

    // TODO: this extern is incomplete - https://api.haxe.org/Array.html

    var length(default, null):Int;

    inline function push(x: T):Int {
        return HxArray.push(this, x);
    }

    inline function concat(a:Array<T>):Array<T> {
        return HxArray.concat(this, a);
    }

    inline function copy():Array<T> {
        return HxArray.copy(this);
    }

    inline function pop():Null<T> {
        return HxArray.pop(this);
    }

    inline function reverse():Void {
        HxArray.reverse(this);
    }

    inline function shift():Null<T> {
        return HxArray.shift(this);
    }

    inline function unshift(x:T):Void {
        HxArray.unshift(this, x);
    }

    inline function splice(pos:Int, len:Int):Array<T> {
        return HxArray.splice(this, pos, len);
    }

    inline function insert(pos:Int, x:T):Void {
        HxArray.insert(this, pos, x);
    }

    inline function slice(pos:Int, ?end:Int):Array<T> {
        return HxArray.slice(this, pos, end);
    }

    inline function remove(x:T):Bool {
        return HxArray.remove(this, x);
    }

    inline function indexOf(x:T, ?fromIndex:Int):Int {
        return HxArray.indexOf(this, x, fromIndex);
    }

    inline function lastIndexOf(x:T, ?fromIndex:Int):Int {
        return HxArray.lastIndexOf(this, x, fromIndex);
    }

    @:pure inline function contains( x : T ) : Bool {
        return HxArray.contains(this, x);
    }

    inline function join(sep:String):String {
        return HxArray.join(this, sep);
    }

    inline function toString():String {
        return HxArray.toString(this);
    }

    // TODO: the following needs to be implemented
    function new(): Void;
    function sort(f:T->T->Int):Void;
    function resize(len:Int):Void;

    @:runtime inline function iterator():haxe.iterators.ArrayIterator<T> {
        return new haxe.iterators.ArrayIterator(this);
    }

    @:pure @:runtime public inline function keyValueIterator() : ArrayKeyValueIterator<T> {
        return new ArrayKeyValueIterator(this);
    }

    @:runtime inline function map<S>(f:T->S):Array<S> {
        return [];
    }

    @:runtime inline function filter(f:T->Bool):Array<T> {
        return [];
    }

}