package hx2go.hxb;

import haxe.io.Bytes;

/**
	A single raw chunk: its `kind` and the undecoded `data` payload (everything
	after the 3-byte name and 4-byte length prefix).
**/
@:structInit
class Chunk {
	public var kind:ChunkKind;
	public var data:Bytes;

	public function new(kind:ChunkKind, data:Bytes) {
		this.kind = kind;
		this.data = data;
	}

	public function toString():String {
		return '${kind.toName()}(${data.length} bytes)';
	}
}
