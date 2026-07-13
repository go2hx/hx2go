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

import haxe.Int64Helper;
import go.time.Time;

@:coreApi final class Date {
	private var t:Time;

	public function new(year:Int, month:Int, day:Int, hour:Int, min:Int, sec:Int):Void {
		t = Time.date(year, month, day, hour, min, sec, 0, Time.local);
	}

	public function getTime():Float {
        return t.unix();
	}

	public function getFullYear():Int {
		return t.year();
	}

	public function getMonth():Int {
		return t.month();
	}

	public function getDate():Int {
		return t.unix();
	}

	public function getHours():Int {
		return t.hour();
	}

	public function getMinutes():Int {
		return t.minute();
	}

	public function getSeconds():Int {
		return t.second();
	}

	public function getDay():Int {
		return t.day();
	}

	public function getUTCFullYear():Int {
		return t.utc().year();
	}

	public function getUTCMonth():Int {
		return t.utc().month();
	}

	public function getUTCDate():Int {
		return t.utc().unix();
	}

	public function getUTCHours():Int {
		return t.utc().hour();
	}

	public function getUTCMinutes():Int {
		return t.utc().minute();
	}

	public function getUTCSeconds():Int {
		return t.utc().second();
	}

	public function getUTCDay():Int {
		return t.utc().day();
	}

	public function getTimezoneOffset():Int {
		return t.zone().offset;
	}

	@:keep public function toString():String {
		return t.string();
	}

	public static function now():Date {
		var d:Date = createEmpty();
		d.t = Time.now();
		return d;
	}

	private static function createEmpty():Date {
		return new Date(0, 0, 0, 0, 0, 0);
	}

	static function fromInt(t:Int):Date {
		var d:Date = createEmpty();
		d.t = Time.unix(t, 0);
		return d;
	}

	public static function fromTime(t:Float):Date {
		var d:Date = createEmpty();
		d.t = Time.unixMilli(Int64Helper.fromFloat(t));
		return d;
	}

	public static function fromString(s:String):Date {
        // The first two formats expressed a date in local time. The third is a time relative to the UTC epoch.
		var d:Date = createEmpty();
		
		var res = Time.parse(Time.dateTime, s);
		if (res.isOk()) {
			d.t = res.sure();
			return d;
		}

		res = Time.parse(Time.dateOnly, s);
		if (res.isOk()) {
			d.t = res.sure();
			return d;
		}

		res = Time.parse(Time.timeOnly, s);
		if (res.isOk()) {
			d.t = res.sure();
			return d;
		}
		throw "Invalid date format : " + s;
	}
}
