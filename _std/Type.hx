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

import go.Syntax;

enum ValueType {
	TNull;
	TInt;
	TInt64;
	TFloat;
	TBool;
	TObject;
	TFunction;
	TClass(c:Class<Dynamic>);
	TEnum(e:Enum<Dynamic>);
	TUnknown;
}

@:coreApi
class Type {

	public static function getClass<T>(o:T):Null<Class<T>> {
		throw "not implemented";
	}

	public static function getEnum(o:EnumValue):Null<Enum<Dynamic>> {
		throw "not implemented";
	}

	public static function getSuperClass(c:Class<Dynamic>):Null<Class<Dynamic>> {
		throw "not implemented";
	}

	public static function getClassName(c:Class<Dynamic>):String {
		throw "not implemented";
	}

	public static function getEnumName(e:Enum<Dynamic>):String {
		throw "not implemented";
	}

	public static function resolveClass(name:String):Null<Class<Dynamic>> {
		throw "not implemented";
	}

	public static function resolveEnum(name:String):Null<Enum<Dynamic>> {
		throw "not implemented";
	}

	public static function createInstance<T>(cl:Class<T>, args:Array<Dynamic>):T {
		throw "not implemented";
	}

	public static function createEmptyInstance<T>(cl:Class<T>):T {
		throw "not implemented";
	}

	public static function createEnum<T>(e:Enum<T>, constr:String, ?params:Array<Dynamic>):T {
		throw "not implemented";
	}

	public static function createEnumIndex<T>(e:Enum<T>, index:Int, ?params:Array<Dynamic>):T {
		throw "not implemented";
	}

	public static function getInstanceFields(c:Class<Dynamic>):Array<String> {
        throw "not implemented";
	}

	public static function getClassFields(c:Class<Dynamic>):Array<String> {
		throw "not implemented";
	}

	public static function getEnumConstructs(e:Enum<Dynamic>):Array<String> {
		throw "not implemented";
	}

	public static function typeof(v:Dynamic):ValueType {
		throw "not implemented";
	}

	public static function enumEq<T:EnumValue>(a:T, b:T):Bool {
		throw "not implemented";
	}

	public static function enumConstructor(e:EnumValue):String {
        throw "not implemented";
	}

	public static function enumParameters(e:EnumValue):Array<Dynamic> {
		return Syntax.code('{0}.Hx_Field_enumParams()', e);
	}

	public static function enumIndex(e:EnumValue):Int {
		return Syntax.code('{0}.Hx_Field_enumIndex()', e);
	}

	public static function allEnums<T>(e:Enum<T>):Array<T> {
		throw "not implemented";
	}
}
