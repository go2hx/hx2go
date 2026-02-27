package;

import preprocessor.Scope;
import haxe.macro.Expr;
import haxe.CallStack.StackItem;

enum abstract HaxeExprFlags(Int) from Int to Int {
    public var Processed = 1;
	public var Transformed = 2;
}

@:structInit
class HaxeExpr {
	public var remapTo:Null<String> = null;
	public var scope: Scope = null;
	public var parent:HaxeExpr = null;
	public var parentIdx:Int = 0;
	public var flags:HaxeExprFlags = 0;
	public var special:SpecialExprDef = null;
	public var def:HaxeExprDef;
	public var t:String;
	// public var stck: Array<Array<StackItem>> = [];

	public function copy(deep: Bool = false): HaxeExpr {
	    return {
			remapTo: remapTo,
			parent: deep ? parent.copy() : parent,
			parentIdx: parentIdx,
			flags: flags,
			def: def, // Copy.copy(def),
			t: t,
			special: special,
		};
	}

	public function copyFrom(other:HaxeExpr, deep:Bool = false) {
	    remapTo = other.remapTo;
		parent = deep ? other.parent.copy() : other.parent;
		parentIdx = other.parentIdx;
		flags = other.flags;
		def = other.def;
		t = other.t;
		special = other.special;
	}

	public function toString(): String {
		return Std.string(def);
	}
}

enum SpecialExprDef {
    TypeExpr(path:String);
    FStatic(staticField:String, field:String);
	FAnon(field:String);
	Arg(info:String);
	FInstance(inst:String);
	Local;
	DArray;
}

enum HaxeExprDef {
	/**
		A constant.
	**/
	EConst(c:Constant);

	/**
		Array access `e1[e2]`.
	**/
	EArray(e1:HaxeExpr, e2:HaxeExpr);

	/**
		Binary operator `e1 op e2`.
	**/
	EBinop(op:Binop, e1:HaxeExpr, e2:HaxeExpr);

	/**
		Field access on `e.field`.

		If `kind` is null, it is equal to Normal.
	**/
	EField(e:HaxeExpr, field:String, ?kind:EFieldKind);

	/**
		Parentheses `(e)`.
	**/
	EParenthesis(e:HaxeExpr);

	/**
		An object declaration.
	**/
	EObjectDecl(fields:Array<HaxeObjectField>);

	/**
		An array declaration `[el]`.
	**/
	EArrayDecl(values:Array<HaxeExpr>, ct: ComplexType);

	/**
		A call `e(params)`.
	**/
	ECall(e:HaxeExpr, params:Array<HaxeExpr>);

	/**
		A constructor call `new t(params)`.
	**/
	ENew(t:TypePath, params:Array<HaxeExpr>);

	/**
		An unary operator `op` on `e`:

		- `e++` (`op = OpIncrement, postFix = true`)
		- `e--` (`op = OpDecrement, postFix = true`)
		- `++e` (`op = OpIncrement, postFix = false`)
		- `--e` (`op = OpDecrement, postFix = false`)
		- `-e` (`op = OpNeg, postFix = false`)
		- `!e` (`op = OpNot, postFix = false`)
		- `~e` (`op = OpNegBits, postFix = false`)
	**/
	EUnop(op:Unop, postFix:Bool, e:HaxeExpr);

	/**
		Variable declarations.
	**/
	EVars(vars:Array<HaxeVar>);

	/**
		A function declaration.
	**/
	EFunction(kind:Null<FunctionKind>, f:HaxeFunction);

	/**
		A block of expressions `{exprs}`.
	**/
	EBlock(exprs:Array<HaxeExpr>);

	/**
		A `for` expression.
	**/
	EFor(it:HaxeExpr, expr:HaxeExpr);

	/**
		An `if (econd) eif` or `if (econd) eif else eelse` expression.
	**/
	EIf(econd:HaxeExpr, eif:HaxeExpr, eelse:Null<HaxeExpr>);

	/**
		Represents a `while` expression.

		When `normalWhile` is `true` it is `while (...)`.

		When `normalWhile` is `false` it is `do {...} while (...)`.
	**/
	EWhile(econd:HaxeExpr, e:HaxeExpr, normalWhile:Bool);

	/**
		Represents a `switch` expression with related cases and an optional.
		`default` case if `edef != null`.
	**/
	ESwitch(e:HaxeExpr, cases:Array<HaxeCase>, edef:Null<HaxeExpr>);

	/**
		Represents a `try`-expression with related catches.
	**/
	ETry(e:HaxeExpr, catches:Array<HaxeCatch>);

	/**
		A `return` or `return e` expression.
	**/
	EReturn(?e:HaxeExpr);

	/**
		A `break` expression.
	**/
	EBreak;

	/**
		A `continue` expression.
	**/
	EContinue;

	/**
		An `untyped e` source code.
	**/
	EUntyped(e:HaxeExpr);

	/**
		A `throw e` expression.
	**/
	EThrow(e:HaxeExpr);

	/**
		A `cast e` or `cast (e, m)` expression.
	**/
	ECast(e:HaxeExpr, t:Null<ComplexType>);

	/**
		Used internally to provide completion.
	**/
	EDisplay(e:HaxeExpr, displayKind:DisplayKind);

	/**
		A `(econd) ? eif : eelse` expression.
	**/
	ETernary(econd:HaxeExpr, eif:HaxeExpr, eelse:HaxeExpr);

	/**
		A `(e:t)` expression.
	**/
	ECheckType(e:HaxeExpr, t:ComplexType);

	/**
		A `@m e` expression.
	**/
	EMeta(s:MetadataEntry, e:HaxeExpr);

	/**
		An `expr is Type` expression.
	**/
	EIs(e:HaxeExpr, t:ComplexType);

	/**
	    A Go code block, created from Syntax.code
	**/
	EGoCode(format:String, args:Array<HaxeExpr>);

    /**
        The Go expression to create a new slice
    **/
    EGoSliceConstruct(ct:ComplexType);

	/**
	 	Enum index
	**/
	EGoEnumIndex(e:HaxeExpr);

	/**
	    Enum Parameter
	**/
	EGoEnumParameter(e:HaxeExpr, kind:String, index:Int);
}

@:structInit
class HaxeTypeDefinition {
	public var goImports: Array<String> = [];
    /**
     * Adds an import to the go output, duplicates are removed.
     * @param imp The stdlib name or package URL
     */
    public function addGoImport(imp: String): Void {
        if (goImports.contains(imp)) {
            return;
        }

        goImports.push(imp);
    }
	public var name:String;
	public var module:String;
	public var isExtern:Bool;
	// need to cache this after the first use
	public var meta:Void->Array<MetadataEntry>;
	public var fields:Array<HaxeField>;
	public var constructor: HaxeField;
	public var kind:HaxeTypeDefinitionKind;
	public var params:Array<TypeParamDecl>;
	public var superClass: Null<String>;
	public var usages: Map<String, Int> = []; // origin, count
	public var buf: StringBuf = new StringBuf();
}
// Closely structured from: https://api.haxe.org/haxe/macro/TypeDefKind.html
enum HaxeTypeDefinitionKind {
	TDClass;
	TDAbstract;
	TDFields;
}

@:structInit
class HaxeField {
	public var name:String;
	public var kind:HaxeFieldKind;
	public var t:String;
	public var expr:HaxeExpr;
	public var meta:Array<MetadataEntry>;
	public var isStatic:Bool;
	public var pos:Position;
}

enum HaxeFieldKind {
	FFun(f:HaxeFunction);
	FVar;
	FProp(get:String,set:String);
}

@:structInit
/**
	Represents a function in the AST.
**/
typedef HaxeFunction = {
	/**
		A list of function arguments.
	**/
	var args:Array<HaxeFunctionArg>;

	/**
		The return type-hint of the function, if available.
	**/
	var ?ret:ComplexType;
	/**
		An optional list of function parameter type declarations.
	**/
	var ?params:Array<TypeParamDecl>;

	var ?expr:HaxeExpr;
}

typedef HaxeCase = {
	/**
		The value expressions of the case.
	**/
	var values:Array<HaxeExpr>;

	/**
		The optional guard expressions of the case, if available.
	**/
	var ?guard:HaxeExpr;

	/**
		The expression of the case, if available.
	**/
	var ?expr:HaxeExpr;
}

/**
	Represents a catch in the AST.
	@see https://haxe.org/manual/expression-try-catch.html
**/
typedef HaxeCatch = {
	/**
		The name of the catch variable.
	**/
	var name:String;

	/**
		The type of the catch.
	**/
	var ?type:ComplexType;

	/**
		The expression of the catch.
	**/
	var expr:HaxeExpr;
}

/**
	Represents a variable in the AST.
	@see https://haxe.org/manual/expression-var.html
**/
typedef HaxeVar = {
	/**
		The name of the variable.
	**/
	var name:String;

	/**
		The position of the variable name.
	**/
	var ?namePos:Position;

	/**
		The type-hint of the variable, if available.
	**/
	var ?type:ComplexType;

	/**
		The expression of the variable, if available.
	**/
	var ?expr:HaxeExpr;

	/**
		Whether or not the variable can be assigned to.
	**/
	var ?isFinal:Bool;

	/**
		Whether or not the variable is static.
	**/
	var ?isStatic:Bool;

	/**
		Metadata associated with the variable, if available.
	**/
	var ?meta:Metadata;

	/**
	    (hx2go internal) If the variable has been annoymised already.
    **/
    var ?annonymous:Bool;
}

/**
	Represents the field of an object declaration.
**/
typedef HaxeObjectField = {
	/**
		The name of the field.
	**/
	var field:String;

	/**
		The field expression.
	**/
	var expr:HaxeExpr;

	/**
		How the field name is quoted.
	**/
	var ?quotes:QuoteStatus;

	var ?t:ComplexType;
}


/**
	Represents a function argument in the AST.
**/
typedef HaxeFunctionArg = {
	/**
		The name of the function argument.
	**/
	var name:String;

	/**
		Whether or not the function argument is optional.
	**/
	var ?opt:Bool;

	/**
		The type-hint of the function argument, if available.
	**/
	var ?type:ComplexType;

	/**
		The optional value of the function argument, if available.
	**/
	var ?value:HaxeExpr;

	/**
		The metadata of the function argument.
	**/
	var ?meta:Metadata;
}
