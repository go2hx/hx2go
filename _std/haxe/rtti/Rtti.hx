package haxe.rtti;
import go.plugin.T_Ctype__GoString_;
import go.haxe.HxDynamic;
import haxe.rtti.Meta;
import haxe.rtti.CType;
import Type;
import haxe.PosInfos;

class Rtti {

    // convert a metadata map (field/type name -> {metaName -> params}) into the RTTI array form
    static function metaToArray(m:haxe.DynamicAccess<Dynamic>):Array<{name:String, params:Array<String>}> {
        var out = new Array<{name:String, params:Array<String>}>();
        for (key => value in m)
            out.push({name: key, params: value});
        return out;
    }

    static function toFields(names:Array<String>, meta:haxe.DynamicAccess<Dynamic>):Array<ClassField> {
        var out:Array<ClassField> = [];
        for (fld in names)
            out.push({
                type: null,
                set: RNormal, // to do: set to appropriate value based on field access
                platforms: [],
                params:  [], 
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

	// TODO fill out default and skeleton data
	static public function getRtti<T>(c:Class<T>):Classdef {
		if (!hasRtti(c))
			throw "Class " + c + " has no RTTI information, consider adding @:rtti";

		var acf = getStaticFields(c);
		var aif = getInstanceFields(c);
		var tma = metaToArray(Meta.getType(c));

		// superclass
		var sc = HxDynamic.getField(c, "superClass");
		var scV:Null<PathParams> = null;
		if (sc != null)
			scV = {path: HxDynamic.getField(sc, "name"), params: []}; // TODO: add params

		// interfaces
		var interfaces:Array<go.haxe.HxClass> = HxDynamic.getField(c, "interfaces");
		var ifPP = new Array<PathParams>();
		if (interfaces != null)
			for (iv in interfaces)
				ifPP.push({path: go.Syntax.code("{0}.Hx_Field_name", iv), params: null}); // TODO: add params

		// bring it all together
		var r:Classdef = {
			tdynamic: null, // maybe? CClass(HxDynamic.getField(c, "name"), null), // TODO: add params
			superClass: scV,
			statics: acf,
			platforms: [],
			path: Type.getClassName(c),
			params: [], 
			module: null,
			meta: tma,
			isPrivate: false,
			isInterface: false,
			isFinal: false,
			isExtern: false,
			interfaces: ifPP,
			file: null,
			fields: aif,
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
		var sc = HxDynamic.getField(c, "superClass");
		return hasRtti(sc);
	}
}