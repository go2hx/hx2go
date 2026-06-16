package hx2go.hxb;

/**
	The scope a type parameter belongs to when referenced from a type instance:
	the enclosing type, the enclosing field/method, or a local function.
**/
enum TypeParamScope {
	TPSType;
	TPSField;
	TPSLocal;
}
