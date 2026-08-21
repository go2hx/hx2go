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

@:structInit
class Bucket<K, T> {
	public var key:K;
	public var value:T;
	public function new(key,value) {
		this.key = key;
		this.value = value;
	}
}

class ObjectMap<K:{}, T> implements haxe.Constraints.IMap<K, T> {
	var h:go.Map<go.UIntPtr, Bucket<K, T>>;

	public function new():Void {
		h = new go.Map<go.UIntPtr, Bucket<K, T>>();
	}

	static inline function id(key:Dynamic):go.UIntPtr {
		return go.Reflect.valueOf(key).pointer();
	}

	public function set(key:K, value:T):Void {
		@:privateAccess h.set(id(key), {key: key, value: value});
	}

	public function get(key:K):Null<T> {
		if (!@:privateAccess h.exists(id(key)))
			return null;
		return @:privateAccess h.get(id(key)).value;
	}

	public function exists(key:K):Bool {
		return @:privateAccess h.exists(id(key));
	}

	public function remove(key:K):Bool {
		var k = id(key);
		if (!@:privateAccess h.exists(k))
			return false;
		@:privateAccess h.remove(k);
		return true;
	}

	public function keys():Iterator<K> {
		return h.values().toArray().map(b -> b.key).iterator();
	}

	public function iterator():Iterator<T> {
		return h.values().toArray().map(b -> b.value).iterator();
	}

	@:runtime public inline function keyValueIterator():KeyValueIterator<K, T> {
		return new haxe.iterators.MapKeyValueIterator(this);
	}

	public function copy():ObjectMap<K, T> {
		var copied = new ObjectMap();
		for (key in keys())
			copied.set(key, get(key));
		return copied;
	}

	public function toString():String {
		var s = new StringBuf();
		var buckets = h.values();
		s.addChar("[".code);
		for (i in 0...buckets.length) {
			if (i > 0)
				s.add(", ");
			s.add(buckets[i].key);
			s.add(" => ");
			s.add(buckets[i].value);
		}
		s.addChar("]".code);
		return s.toString();
	}

	public function clear():Void {
		@:privateAccess h.clear();
	}

	public function size():Int {
		return h.size();
	}
}
