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

    @:runtime inline extern function iterator():haxe.iterators.ArrayIterator<T> { // TODO: remove "extern" when supported
        return new haxe.iterators.ArrayIterator(this);
    }

    @:pure @:runtime public inline extern function keyValueIterator() : ArrayKeyValueIterator<T> { // TODO: remove "extern" when supported
        return new ArrayKeyValueIterator(this);
    }

    @:runtime inline extern function map<S>(f:T->S):Array<S> { // TODO: remove "extern" when supported
        return HxArray.map(this, f);
    }

    @:runtime inline extern function filter(f:T->Bool):Array<T> { // TODO: remove "extern" when supported
        return HxArray.filter(this, f);
    }

    inline extern function sort(f:T->T->Int):Void {
        HxArray.sort(this, f);
    }

    inline extern function resize(len:Int):Void {
        HxArray.resize(this, len);
    }

    function new(): Void;
}