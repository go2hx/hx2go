package;

import wisdom.Node;
import haxe.xml.Access;
import wisdom.VNode;
import wisdom.Wisdom;
import wisdom.X;
import wisdom.modules.AttributesModule;
import wisdom.modules.ClassModule;
import wisdom.modules.ListenersModule;
import wisdom.modules.PropsModule;
import wisdom.modules.StyleModule;

// custom backend file
import haxe.Constraints.Function;
import wisdom.Node;
import wisdom.Element;
import wisdom.CreateElementOptions;
import wisdom.Text;
import wisdom.Comment;
import wisdom.VNode;
import wisdom.VNodeData;
import wisdom.Xid;
import wisdom.HtmlAttributes;
import wisdom.SvgAttributes;

using StringTools;

// https://gist.github.com/l0go/7bbccea6c96625e7c0bd768f171b7f91
class StaticWisdomBackend extends wisdom.Backend {
	public function new() {}

	public function createElement(tagName: String, ?options: CreateElementOptions #if wisdom_debug, ?pos: haxe.PosInfos #end): Element {
		var element = Xml.createElement(tagName);
		if (untyped options.is != null) {
			element.set("is", untyped options.is);
		}
		return cast element;
	}

	public function createElementNS(namespaceUri: String, qualifiedName: String, ?options: CreateElementOptions
			#if wisdom_debug, ?pos: haxe.PosInfos #end): Element {
		final parts = qualifiedName.split(":");
		var element = Xml.createElement(qualifiedName);

		if (parts.length > 1) {
			element.set('xmlns:${parts[0]}', namespaceUri);
		} else {
			element.set("xmlns", namespaceUri);
		}

		if (untyped options.is != null) {
			element.set("is", untyped options.is);
		}
		return cast element;
	}

	public function createTextNode(text: String #if wisdom_debug, ?pos: haxe.PosInfos #end): Text {
		return cast Xml.createPCData(text);
	}

	public function createComment(text: String #if wisdom_debug, ?pos: haxe.PosInfos #end): Comment {
		return cast Xml.createComment(text);
	}

	public function insertBefore(parentNode: Node, newNode: Node, referenceNode: Null<Node> #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {
		final parentNodeXml: Xml = cast parentNode;
		final newNodeXml: Xml = cast newNode;
		if (referenceNode == null) {
			parentNodeXml.addChild(newNodeXml);
			return;
		}
		final referenceNodeXml: Xml = cast referenceNode;

		if (referenceNodeXml.parent != parentNodeXml) {
			throw "Reference node is not a child of the parent";
		}

		if (newNodeXml.parent != null) {
			newNodeXml.parent.removeChild(newNodeXml);
		}

		final children = [for (x in parentNodeXml.iterator()) x];
		final index = children.indexOf(referenceNodeXml);
		if (index == -1) {
			throw "Reference node not found in parent's children";
		}
		children.insert(index, newNodeXml);

		for (x in parentNodeXml.iterator()) {
			parentNodeXml.removeChild(x);
		}

		for (child in children) {
			parentNodeXml.addChild(child);
		}
	}

	public function removeChild(node: Node, child: Node #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {
		final nodeXml: Xml = cast node;
		nodeXml.removeChild(cast child);
	}

	public function appendChild(node: Node, child: Node #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {
		final nodeXml: Xml = cast node;
		nodeXml.addChild(cast child);
	}

	public function parentNode(node: Node): Null<Node> {
		final nodeXml: Xml = cast node;
		return cast nodeXml.parent;
	}

	public function nextSibling(node: Node): Null<Node> {
		final nodeXml: Xml = cast node;
		final children = [for (x in nodeXml.parent.iterator()) x];
		final index = children.indexOf(nodeXml);
		return cast children[index + 1];
	}

	public function tagName(elm: Element): String {
		final nodeXml: Xml = cast elm;
		return nodeXml.nodeName;
	}

	public function setTextContent(node: Node, text: Null<String> #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {
		final nodeXml: Xml = cast node;
		final children = [for (x in nodeXml.parent.iterator()) x];
		for (child in children) {
			if (child.nodeType == PCData) {
				nodeXml.nodeValue = text;
			}
		}
	}

	public function getTextContent(node: Node): Null<String> {
		final nodeXml: Xml = cast node;
		final children = [for (x in nodeXml.parent.iterator()) x];
		for (child in children) {
			if (child.nodeType == PCData) {
				return child.nodeValue;
			}
		}
		return null;
	}

	public function addClass(elm: Element, name: String #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {
		final elmXml: Xml = cast elm;
		elmXml.set("class", ((elmXml.get("class") ?? "") + ' $name').trim());
	}

	public function removeClass(elm: Element, name: String #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {
		final elmXml: Xml = cast elm;
		var list = elmXml.get("class").split(" ");
		list.remove(name);
		elmXml.set("class", list.join(" "));
	}

	public function setStyle(elm: Element, name: String, value: Any #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {}

	public function removeStyle(elm: Element, name: String #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {}

	public function isElement(node: Any): Bool {
		if (!Std.isOfType(node, Xml)) return false;
		final nodeXml: Xml = cast node;
		return nodeXml.nodeType == Element;
	}

	public function isText(node: Node): Bool {
		if (!Std.isOfType(node, Xml)) return false;
		final nodeXml: Xml = cast node;
		return nodeXml.nodeType == PCData;
	}

	public function isComment(node: Node): Bool {
		if (!Std.isOfType(node, Xml)) return false;
		final nodeXml: Xml = cast node;
		return nodeXml.nodeType == Comment;
	}

	public function elementId(elm: Element): Null<String> {
		final elmXml: Xml = cast elm;
		return elmXml.get("id");
	}

	public function attribute(elm: Element, attr: String): Null<String> {
		final elmXml: Xml = cast elm;
		return elmXml.get(attr);
	}

	public function setAttribute(elm: Element, attr: String, value: String #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {
		final elmXml: Xml = cast elm;
		elmXml.set(attr, value);
	}

	public function removeAttribute(elm: Element, attr: String #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {
		final elmXml: Xml = cast elm;
		elmXml.remove(attr);
	}

	public function setProp(elm: Element, name: String, value: Any #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {}

	public function resetProp(elm: Element, name: String #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {};

	public function elementToNode(elm: Element): Node {
		return cast elm;
	}

	public function textToNode(text: Text): Node {
		return cast text;
	}

	public function commentToNode(comment: Comment): Node {
		return cast comment;
	}

	public function vnodeDataToCreateElementOptions(data: VNodeData): CreateElementOptions {
		return cast {
			'is': data.isa
		};
	}

	public function isAttribute(sel: String, name: String): Bool {
		return HtmlAttributes.isValidAttribute(sel, name) || SvgAttributes.isValidAttribute(sel, name);
	}

	public function addEventListener(elm: Element, event: String, listener: Function #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {}

	public function removeEventListener(elm: Element, event: String, listener: Function #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {}

	public function fallbackComponentVNode(xid: Xid, #if wisdom_debug, ?pos: haxe.PosInfos #end): VNode {
		return VNode.vnode(xid, 'div', {}, [], null, null);
	}

	public function didAppendChildren(elm: Element #if wisdom_debug, ?pos: haxe.PosInfos #end): Void {}
}
//

class Test implements X {
  static function main() {
    var test = new Test();
    // supposed to print
    // parsed: ,<div class="my-wisdom-words">Some words of wisdom</div>
	var elm:String = cast test.container.elm;
    trace("parsed: ", elm);
	// TODO when String null is fixed can be a sraight equality check rather then contains
	if (!StringTools.contains(elm, 'Some words of wisdom</div>')) {
		throw "failure";
	}
  }

  var container: VNode;

  public function new() {
    var wisdom = new Wisdom([
        ClassModule.module(),
        StyleModule.module(),
        PropsModule.module(),
        AttributesModule.module(),
        ListenersModule.module()
      ],
      new StaticWisdomBackend()
    );

    this.container = {
      xid: "",
      sel: "",
      data: {},
      children: [],
      elm: cast Xml.createDocument(),
      text: null,
      key: null
    };

    this.container = wisdom.patch(container,
      '<>
          <div class="my-wisdom-words">
              Some words of wisdom
        </div>
      '
    );
  }
}