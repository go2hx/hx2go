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

package sys.thread;

import go.Syntax;
import go.Runtime;
import go.Strconv;
import go.Strings;
import go.Strings.Strings.fields;
import go.Strconv.Strconv.atoi;
import go.Strings.Strings.trimPrefix;
import go.Byte;
import go.Runtime.Runtime.stack;
import go.Slice;
import go.Go.Go.string;
import go.Go;

private class NativeThread {

	public static function current(): NativeThread {
		return new NativeThread(null);
	}

	public function new(job: () -> Void) {
		if (job != null) Syntax.go(job);
	}

	public function getName(): String {
		return "";
	}

	public function setName(name: String): Void {
		return;
	}

}

abstract ThreadImpl(NativeThread) {

	public static inline function current(): ThreadImpl {
		return cast NativeThread.current();
	}

	public static inline function create(job: Void->Void): ThreadImpl {
		return cast new NativeThread(job);
	}

	public static function setName(t: ThreadImpl, name: String) {
		(cast t : NativeThread).setName(name);
	}

	public static function getName(t: ThreadImpl ) {
		return (cast t : NativeThread).getName();
	}

	private static function getGoroutineId(): Int {
		var buf = new Slice<Byte>(64); // TODO: can goroutine IDs be re-used? If so, TLS must be cleared
		var n = Runtime.stack(buf, false);
		var stk = Strings.trimPrefix(Go.string(buf.sliceEnd(n)), "goroutine");
		var field = Strings.fields(stk)[0];

		return Strconv.atoi(field).sure();
	}

}