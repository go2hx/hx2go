package unit;

private class Base<T> {
	public var received : T;
	public var receivedInCtor : T;

	public function new(item : T) {
		onItem(item);
		receivedInCtor = received;
	}

	public dynamic function onItem(item : T) : Void {
		received = item;
	}

	public function trigger(item : T) {
		onItem(item);
	}
}

private class Sub extends Base<String> {
	public function new() {
		super("ctor");
	}

	override function onItem(item : String) {
		received = item.toUpperCase();
	}
}

private class Mid extends Base<String> {
}

private class SubOfMid extends Mid {
	public function new() {
		super("ctor");
	}

	override function onItem(item : String) {
		received = item.toUpperCase();
	}
}

private class NoCtorBase {
	public var received : String;
	public var receivedInCtor : String;

	public dynamic function onItem(item : String) : Void {
		received = item;
	}

	public function trigger(item : String) {
		onItem(item);
	}
}

private class SubOfNoCtor extends NoCtorBase {
	public function new() {
		trigger("ctor");
		receivedInCtor = received;
	}

	override function onItem(item : String) {
		received = item.toUpperCase();
	}
}

class Issue13043 {
    public function new() {}

	public function testNoOverride() {
		var b = new Base<String>("ctor");
		assert("ctor" == b.receivedInCtor);
		b.trigger("hi");
		assert("hi" == b.received);
		b.onItem("ho");
		assert("ho" == b.received);
	}

	public function testOverrideAsSub() {
		var s = new Sub();
		assert("CTOR" == s.receivedInCtor);
		s.trigger("hi");
		assert("HI" == s.received);
		s.onItem("ho");
		assert("HO" == s.received);

		s.onItem = function(item) { s.received = item + "!"; };
		s.trigger("hi");
		assert("hi!" == s.received);
		s.onItem("ho");
		assert("ho!" == s.received);
	}

	public function testOverrideAsBase() {
		var b : Base<String> = new Sub();
		b.trigger("hi");
		assert("HI" == b.received);
		b.onItem("ho");
		assert("HO" == b.received);

		b.onItem = function(item) { b.received = item + "!"; };
		b.trigger("hi");
		assert("hi!" == b.received);
		b.onItem("ho");
		assert("ho!" == b.received);

		// assigning null must not wrap it into a non null closure
		#if (!lua && !cppia)
		b.onItem = null;
		assert(b.onItem == null);
		#end
	}

	public function testOverrideSkippingParent() {
		var b : Base<String> = new SubOfMid();
		assert("CTOR" == b.receivedInCtor);
		b.trigger("hi");
		assert("HI" == b.received);
		b.onItem("ho");
		assert("HO" == b.received);

		// assigning through the subclass must reach the field of the declaring class
		var s = new SubOfMid();
		s.onItem = function(item) { s.received = item + "!"; };
		s.trigger("hi");
		assert("hi!" == s.received);
		s.onItem("ho");
		assert("ho!" == s.received);
	}

	public function testOverrideWithoutParentCtor() {
		var b : NoCtorBase = new SubOfNoCtor();
		assert("CTOR" == b.receivedInCtor);
		b.trigger("hi");
		assert("HI" == b.received);
		b.onItem("ho");
		assert("HO" == b.received);

		b.onItem = function(item) { b.received = item + "!"; };
		b.trigger("hi");
		assert("hi!" == b.received);
		b.onItem("ho");
		assert("ho!" == b.received);
	}
}

function main() {
	var test = new Issue13043();
	test.testNoOverride();
	test.testOverrideAsSub();
	test.testOverrideAsBase();
	test.testOverrideSkippingParent();
	test.testOverrideWithoutParentCtor();
}