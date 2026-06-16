package hx2go.hxb;

import haxe.io.Bytes;

/** One typed field expression with the field and type that own it. **/
typedef FieldExprEntry = {
	var type:HxbModuleType;
	var field:HxbClassField;
	var expr:hx2go.hxb.Typed.HxbTypedExpr;
};

/**
	The friendly front door to the library.

	```haxe
	var archive = Hxb.loadArchive("cache.hxb");      // open the zip
	for (ref in archive.modules()) trace(ref);        // navigate
	var module = archive.decode(archive.findModule("haxe.ds.Vector"));
	for (e in Hxb.fieldExprs(module))
	    Sys.println(e.field.name + " = " + hxb.print.TypedExprPrinter.print(e.expr));
	```
**/
class Hxb {
	/** Read a single serialized module's raw chunks (container level). **/
	public static inline function readChunks(bytes:Bytes):ChunkedModule {
		return ChunkedModule.read(bytes);
	}

	/** Decode a single serialized module's bytes into the structured model. **/
	public static inline function decodeModule(bytes:Bytes):HxbModule {
		return hx2go.hxb.read.ModuleDecoder.decode(bytes);
	}

	/**
		Re-serialize a structured module back to HXB module bytes. The output
		round-trips through `decodeModule` to an equal model and individual
		modules load in the Haxe compiler via `--hxb-lib`.
	**/
	public static inline function encodeModule(m:HxbModule):Bytes {
		return hx2go.hxb.write.ModuleEncoder.encode(m);
	}

	/** Open an HXB archive (zip) from in-memory bytes. **/
	public static inline function openArchive(bytes:Bytes):HxbArchive {
		return HxbArchive.read(bytes);
	}

	#if sys
	/** Open an HXB archive (zip) from a file path. **/
	public static inline function loadArchive(path:String):HxbArchive {
		return HxbArchive.load(path);
	}
	#end

	/**
		Collect every field-level typed expression in a module (constructor,
		init, members and statics of every class), each paired with its owning
		type and field.
	**/
	public static function fieldExprs(m:HxbModule):Array<FieldExprEntry> {
		final out:Array<FieldExprEntry> = [];
		for (t in m.types)
			switch (t) {
				case MClass(c):
					inline function add(cf:Null<HxbClassField>) {
						if (cf != null && cf.expr != null)
							out.push({type: t, field: cf, expr: cf.expr.expr});
						if (cf != null)
							for (ov in cf.overloads)
								if (ov.expr != null)
									out.push({type: t, field: ov, expr: ov.expr.expr});
					}
					add(c.constructor);
					add(c.init);
					for (cf in c.fields) add(cf);
					for (cf in c.statics) add(cf);
				case _:
			}
		return out;
	}
}
