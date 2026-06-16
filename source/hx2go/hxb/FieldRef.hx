package hx2go.hxb;

/**
	A reference to a class field: the owning class, which slot, the field name
	(absent for constructor/init) and an overload `depth` (0 = the field itself).
**/
@:structInit
class FieldRef {
	public var owner:TypePath;
	public var kind:FieldRefKind;
	public var name:Null<String>;
	public var depth:Int;

	public function new(owner:TypePath, kind:FieldRefKind, name:Null<String>, depth:Int) {
		this.owner = owner;
		this.kind = kind;
		this.name = name;
		this.depth = depth;
	}

	public function toString():String {
		final n = name == null ? Std.string(kind) : name;
		return '${owner.dotPath()}#$n' + (depth > 0 ? '/$depth' : "");
	}
}
