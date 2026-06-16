package hx2go.hxb;

/** Which slot of a class a `FieldRef` points at. **/
enum FieldRefKind {
	FRStatic;
	FRMember;
	FRConstructor;
	FRInit;
}
