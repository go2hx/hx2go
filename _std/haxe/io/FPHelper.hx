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

package haxe.io;

import haxe.Int32;
import go.Math as GoMath;
import go.Syntax;
import go.UInt64;

@:coreApi(check = Off)
class FPHelper {

	public static function i32ToFloat(i: Int32): Single {
		return GoMath.float32frombits(cast i);
	}

	public static function floatToI32(f: Single): Int32 {
		return cast GoMath.float32bits(f);
	}

	public static function i64ToDouble(low: Int32, high: Int32): Float {
		var bits: UInt64 = Syntax.code("(uint64(uint32({0})) << 32) | uint64(uint32({1}))", high, low);
		return GoMath.float64frombits(bits);
	}

	public static function doubleToI64(v: Float): Int64 {
		var bits: UInt64 = GoMath.float64bits(v);
		var low: Int32 = Syntax.code("int32(uint32({0}))", bits);
		var high: Int32 = Syntax.code("int32(uint32({0} >> 32))", bits);
		return Int64.make(high, low);
	}

}