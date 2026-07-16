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
import go.Time;

@:coreApi final class Date {
	private var t: go.time.Time;

	public function new(year:Int, month:Int, day:Int, hour:Int, min:Int, sec:Int):Void {
		// Haxe months are 0-based (Jan = 0); Go's time.Month is 1-based (Jan = 1).
		t = Time.date(year, month + 1, day, hour, min, sec, 0, Time.Local);
	}

	public function getTime():Float {
        // Haxe getTime is in milliseconds since the Unix epoch.
        return t.unixMilli();
	}

	public function getFullYear():Int {
		return t.year();
	}

	public function getMonth():Int {
		return t.month() - 1;
	}

	public function getDate():Int {
		return t.day();
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
		return t.weekday();
	}

	public function getUTCFullYear():Int {
		return t.UTC().year();
	}

	public function getUTCMonth():Int {
		return t.UTC().month() - 1;
	}

	public function getUTCDate():Int {
		return t.UTC().day();
	}

	public function getUTCHours():Int {
		return t.UTC().hour();
	}

	public function getUTCMinutes():Int {
		return t.UTC().minute();
	}

	public function getUTCSeconds():Int {
		return t.UTC().second();
	}

	public function getUTCDay():Int {
		return t.UTC().weekday();
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
		
		var res = Time.parse(Time.DateTime, s);
		if (res.isOk()) {
			d.t = res.sure();
			return d;
		}

		res = Time.parse(Time.DateOnly, s);
		if (res.isOk()) {
			d.t = res.sure();
			return d;
		}

		res = Time.parse(Time.TimeOnly, s);
		if (res.isOk()) {
			d.t = res.sure();
			return d;
		}
		throw "Invalid date format : " + s;
	}
}
