package haxe.ds;

import go.Slice;

private typedef VectorData<T> = Array<T>;

abstract Vector<T>(VectorData<T>) {
	extern overload public inline function new(length:Int) {
		var x = new Slice(length);
		this = cast (x.toArray() : Array<Dynamic>);
	}

	extern overload public inline function new(length:Int, defaultValue:T):Vector<T> {
		this = new Array();
        for (i in 0...length) {
            set(i, defaultValue);
        }
	}

	@:op([]) public inline extern function get(index:Int): T {
		return this[index];
	}

	@:op([]) public inline extern function set(index:Int, val:T): T {
		this[index] = val;
		return val;
	}

	public var length(get, never):Int;

	inline function get_length():Int {
		return this.length;
	}

	public inline function fill(value:T):Void
		for (i in 0...length) this[i] = value;

	public static inline extern function blit<T>(src:Vector<T>, srcPos:Int, dest:Vector<T>, destPos:Int, len:Int):Void {
		if (src == dest) {
			if (srcPos < destPos) {
				var i = srcPos + len;
				var j = destPos + len;
				for (k in 0...len) {
					i--;
					j--;
					src[j] = src[i];
				}
			} else if (srcPos > destPos) {
				var i = srcPos;
				var j = destPos;
				for (k in 0...len) {
					src[j] = src[i];
					i++;
					j++;
				}
			}
		} else {
			for (i in 0...len) {
				dest[destPos + i] = src[srcPos + i];
			}
		}
	}

	public inline extern function toArray():Array<T> {
		return this;
	}

	public inline extern function toData():VectorData<T>
		return this;

	static public extern inline function fromData<T>(data:VectorData<T>):Vector<T>
		return cast data;

	static public extern inline function fromArrayCopy<T>(array:Array<T>):Vector<T> {
		return cast array.copy();
	}

	public inline extern function copy<T>():Vector<T> {
        return cast fromArrayCopy(this.copy());
	}

	public inline function join<T>(sep:String):String {
        return this.join(sep);
	}

	public inline extern function sort(f:T->T->Int):Void {
		this.sort(f);
	}

	public inline extern function map<S>(f:T->S):Vector<S> {
		var length = length;
		var r = new Vector<S>(length);
		var i = 0;
		var len = length;
		for (i in 0...len) {
			var v = f(get(i));
			r.set(i, v);
		}
		return r;
	}
}
