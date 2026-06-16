package hx2go.hxb;

/** A reference to an enum constructor: the owning enum and the constructor name. **/
@:structInit
class EnumFieldRef {
	public var owner:TypePath;
	public var name:String;

	public function new(owner:TypePath, name:String) {
		this.owner = owner;
		this.name = name;
	}

	public function toString():String {
		return '${owner.dotPath()}.$name';
	}
}
