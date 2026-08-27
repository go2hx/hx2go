import haxe.iterators.ArrayKeyValueIterator;

@:coreType
extern class Array<T> {

    var length(default, null):Int;

    inline function push(x: T):Int {
        return 0;
    }

    inline function concat(a:Array<T>):Array<T> {
        return [];
    }

    inline function copy():Array<T> {
        return [];
    }

    inline function pop():Null<T> {
        return null;
    }

    inline function reverse():Void {
        return;
    }

    inline function shift():Null<T> {
        return null;
    }

    inline function unshift(x:T):Void {
        return;
    }

    inline function splice(pos:Int, len:Int):Array<T> {
        return [];
    }

    inline function insert(pos:Int, x:T):Void {
        return;
    }

    inline function slice(pos:Int, ?end:Int):Array<T> {
        return [];
    }

    inline function remove(x:T):Bool {
        return false;
    }

    inline function indexOf(x:T, ?fromIndex:Int):Int {
        return -1;
    }

    inline function lastIndexOf(x:T, ?fromIndex:Int):Int {
        return -1;
    }

    @:pure inline function contains( x : T ) : Bool {
        return false;
    }

    inline function join(sep:String):String {
        return "";
    }

    inline function toString():String {
        return "";
    }

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

    inline function sort(f:T->T->Int):Void {
        return;
    }

    inline function resize(len:Int):Void {
        return;
    }

    function new(): Void;
}