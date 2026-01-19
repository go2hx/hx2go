/*
 * Copyright (C)2005-2019 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

/**
	An Array is a storage for values. You can access it using indexes or
	with its API.

	@see https://haxe.org/manual/std-Array.html
	@see https://haxe.org/manual/lf-array-comprehension.html
**/

import haxe.iterators.ArrayKeyValueIterator;
import runtime.HxArray;

@:coreType
extern class Array<T> {
    var length(default, null):Int;

    function new():Void;
    function concat(a:Array<T>):Array<T>;
    function join(sep:String):String;
    function pop():Null<T>;
    inline function push(x:T):Int {
        return HxArray.push(this, x);
    }
    function reverse():Void;
    function shift():Null<T>;
    function slice(pos:Int, ?end:Int):Array<T>;
    function sort(f:T->T->Int):Void;
    function splice(pos:Int, len:Int):Array<T>;
    function toString():String;
    function unshift(x:T):Void;
    function insert(pos:Int, x:T):Void;
    function remove(x:T):Bool;
    @:pure function contains( x : T ) : Bool;
    function indexOf(x:T, ?fromIndex:Int):Int;
    function lastIndexOf(x:T, ?fromIndex:Int):Int;
    function copy():Array<T>;
    @:runtime inline function iterator():haxe.iterators.ArrayIterator<T> {
        return new haxe.iterators.ArrayIterator(this);
    }
    @:pure @:runtime public inline function keyValueIterator() : ArrayKeyValueIterator<T> {
        return new ArrayKeyValueIterator(this);
    }
    @:runtime inline function map<S>(f:T->S):Array<S> {
        #if (cpp && !cppia)
		var result = cpp.NativeArray.create(length);
		for (i in 0...length) cpp.NativeArray.unsafeSet(result, i, f(cpp.NativeArray.unsafeGet(this, i)));
		return result;
		#else
        return [for (v in this) f(v)];
        #end
    }
    @:runtime inline function filter(f:T->Bool):Array<T> {
        return [for (v in this) if (f(v)) v];
    }
    function resize(len:Int):Void;
}