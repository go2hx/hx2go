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

package haxe.ds;

import go.Slice;

private class StringMapKeysIterator {
	var arr:Slice<String>;
	var pos:Int;
	var length:Int;

	public inline function new(h:Slice<String>) {
		this.arr = h;
		pos = 0;
		length = arr.length;
	}

	public inline function hasNext() {
		return pos < length;
	}

	public inline function next() @:privateAccess {
		var b = arr[pos++];
		return b;
	}
}

class StringMap<T> implements haxe.Constraints.IMap<String, T> {
	var h:go.Map<String, T> = null;

	public function new():Void {
		h = new go.Map<String, T>();
	}

	public function set(key:String, value:T):Void {
		@:privateAccess h.set(key, value);
	}

	public function get(key:String):Null<T> {
		if (key == null)
			return null;
		return @:privateAccess h.get(key);
	}

	public function exists(key:String):Bool {
		if (key == null)
			return false;
		return @:privateAccess h.exists(key);
	}

	public function remove(key:String):Bool {
		if (key == null)
			return false;
        var prevSize = h.size();
		@:privateAccess h.remove(key);
        return prevSize != h.size();
	}

	public function keys():Iterator<String> {
		return new StringMapKeysIterator(h.keys());
	}

	public function iterator():Iterator<T> {
		return h.values().iterator();
	}

	@:runtime public inline function keyValueIterator():KeyValueIterator<String, T> {
		return new haxe.iterators.MapKeyValueIterator(this);
	}

	public function copy():StringMap<T> {
		var copied = new StringMap();
		for (key in keys())
			copied.set(key, get(key));
		return copied;
	}

	public function toString():String {
		var s = new StringBuf();
		var keys = h.keys();
		var values = h.values();
		s.addChar("[".code);
		for (i in 0...keys.length) {
			if (i > 0)
				s.add(", ");
			var k = keys[i];
            s.add(k);
			s.add(" => ");
			s.add(values[i]);
		}
		s.addChar("]".code);
		return s.toString();
	}

    public function size():Int {
        return h.size();
    }

	public function clear():Void {
		h.clear();
	}
}
