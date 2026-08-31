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

import go.Time;
import go.Go;
import go.Syntax;

@:coreApi
class Lock {
	var c:go.Chan<Bool>;
	public function new():Void {
		c = new go.Chan(1);
	}

	public function wait(?timeout:Float):Bool {
		if (timeout == null) {
			c.receive();
			return true;
		}

		var acquired = false;
		Syntax.select(Select.receive(c, (_) -> {
			acquired = true;
		}), Select.receive(Time.after(Go.int64(timeout * 1e9)), (_) -> {
			acquired = false;
		}));
		return acquired;
	}

	public function release():Void {
		var sent = false;
		Syntax.select(Select.send(c, true, () -> {
			sent = true;
		}), Select.defaultCase(() -> {}));
		if (sent)
			return;
		Syntax.go(() -> c.send(true));
	}
}