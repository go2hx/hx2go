package haxe.rtti;

import go.haxe.HxDynamic;
import haxe.rtti.Meta;
import haxe.rtti.CType;
import Type;

class Rtti {
	// convert a metadata map (field/type name -> {metaName -> params}) into the RTTI array form
	static function metaToArray(m:haxe.DynamicAccess<Dynamic>):Array<{name:String, params:Array<String>}> {
		var out = new Array<{name:String, params:Array<String>}>();
		for (key => value in m)
			out.push({name: key, params: (value:Array<String>)});
		return out;
	}

	static function toFields(names:Array<String>, meta:haxe.DynamicAccess<Dynamic>):Array<ClassField> {
		var out:Array<ClassField> = [];
		for (fld in names)
			out.push({
				type: CType.CUnknown, // to do: set to appropriate value based on field type
				set: RNormal, // to do: set to appropriate value based on field access
				platforms: [],
				params: [],
				overloads: null,
				name: fld,
				meta: meta.exists(fld) ? metaToArray(meta.get(fld)) : [],
				line: null,
				isPublic: true,
				isOverride: false,
				isFinal: false,
				get: RNormal, // to do: set to appropriate value based on field access
				expr: null,
				doc: null
			});
		return out;
	}

	static function getStaticFields<T>(c:Class<T>):Array<ClassField>
		return toFields(Type.getClassFields(c), Meta.getStatics(c));

	static function getInstanceFields<T>(c:Class<T>):Array<ClassField>
		return toFields(Type.getInstanceFields(c), Meta.getFields(c));

	static function readClass(content:String) {
		var xml = Xml.parse(content);
		var cl = xml.firstElement();
		var infos = new haxe.rtti.XmlParser().processElement(cl);
		switch (infos) {
			case TClassdecl(c):
				// remove static field __rtti if it exists
				c.statics = c.statics.filter(f -> f.name != "__rtti");
				// tidy up the platforms for static and instance fields
				for (i in 0...c.statics.length)
					c.statics[i].platforms = [];
				for (i in 0...c.fields.length)
					c.fields[i].platforms = [];
		return c;
			case _:
		}
		return null;
	}

	static public function getRtti<T>(c:Class<T>):Classdef {
		if (!hasRtti(c))
			throw "Class " + c + " has no RTTI information, consider adding @:rtti";

		var className = Type.getClassName(c);

		// get the RTTI XML from the HxRttiMap
		var rttiXML:String = go.Syntax.code("HxRttiMap[{0}]", className);
		if (rttiXML != null && rttiXML != "") {
			var cl = readClass(rttiXML);
			if (cl != null)
				return cl;
		}
		// if we couldn't get the RTTI XML, so manually construct the RTTI information as best we can

		// superclass
		var sc = HxDynamic.getField(c, "superClass");
		var scV:Null<PathParams> = null;
		if (sc != null)
			scV = {path: HxDynamic.getField(sc, "name"), params: []}; // TODO: add params

		// interfaces
		var interfaces:Array<go.haxe.HxClass> = HxDynamic.getField(c, "interfaces");
		var interfacePathParams = new Array<PathParams>();
		if (interfaces != null)
			for (iv in interfaces)
				interfacePathParams.push({path: go.Syntax.code("{0}.Hx_Field_name", iv), params: []});

		// bring it all together
		var r:Classdef = {
			tdynamic: null,
			superClass: scV,
			statics: getStaticFields(c),
			platforms: [],
			path: className,
			params: [],
			module: null,
			meta: metaToArray(Meta.getType(c)),
			isPrivate: false,
			isInterface: false,
			isFinal: false,
			isExtern: false,
			interfaces: interfacePathParams,
			file: null,
			fields: getInstanceFields(c),
			doc: null
		};
		return r;
	}

	static public function hasRtti<T>(c:Class<T>):Bool {
		if (c == null)
			return false;
		var meta = HxDynamic.getField(c, "__meta__");
		if (meta != null)
			if (HxDynamic.getField(meta, "rtti") == true)
				return true;
		var sc:Class<Dynamic> = HxDynamic.getField(c, "superClass");
		return hasRtti(sc);
	}
}
