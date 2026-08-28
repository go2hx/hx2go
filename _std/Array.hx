import haxe.iterators.ArrayKeyValueIterator;

@:coreType
extern class Array<T> {

    var length(default, null):Int;

    function push(x: T):Int;
    function concat(a:Array<T>):Array<T>;
    function copy():Array<T>;
    function pop():Null<T>;
    function map<S>(f:T->S):Array<S>;
    function reverse():Void;
    function shift():Null<T>;
    function toString():String;
    @:pure function contains(x: T): Bool;
    @:runtime function filter(f:T->Bool):Array<T>;
    function resize(len:Int):Void;
    function join(sep:String):String;
    function sort(f:T->T->Int):Void;

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

    @:runtime inline function iterator():haxe.iterators.ArrayIterator<T> {
        return new haxe.iterators.ArrayIterator(this);
    }

    @:pure @:runtime public inline function keyValueIterator() : ArrayKeyValueIterator<T> {
        return new ArrayKeyValueIterator(this);
    }

    function new(): Void;
}