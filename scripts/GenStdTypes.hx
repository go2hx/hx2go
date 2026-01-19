using StringTools;

/*
    This script is here to quickly generate all the integer and float types inside of ``/go``
    The script is to possibly be replaced by go2hx generation in the future, but considering the specific nature of these types, that may not happen.
*/

import sys.io.File;
import haxe.io.Path;

var types = ["int", "uint", "uint8", "uint16", "uint32", "uint64", "int8", "int16", "int32", "int64", "float32", "float64"];
var operators = [
    { name: "add",      format: "A + B",   bitwise: false, outFloat: false, outBool: false, unary: false, commutative: true  },
    { name: "sub",      format: "A - B",   bitwise: false, outFloat: false, outBool: false, unary: false, commutative: false },
    { name: "mul",      format: "A * B",   bitwise: false, outFloat: false, outBool: false, unary: false, commutative: true  },
    { name: "div",      format: "A / B",   bitwise: false, outFloat: true,  outBool: false, unary: false, commutative: false },
    { name: "mod",      format: "A % B",   bitwise: false, outFloat: false, outBool: false, unary: false, commutative: false },
    { name: "neg",      format: "-A",      bitwise: false, outFloat: false, outBool: false, unary: true,  commutative: false },
    { name: "preinc",   format: "++A",     bitwise: false, outFloat: false, outBool: false, unary: true,  commutative: false },
    { name: "postinc",  format: "A++",     bitwise: false, outFloat: false, outBool: false, unary: true,  commutative: false },
    { name: "predec",   format: "--A",     bitwise: false, outFloat: false, outBool: false, unary: true,  commutative: false },
    { name: "postdec",  format: "A--",     bitwise: false, outFloat: false, outBool: false, unary: true,  commutative: false },
    { name: "eq",       format: "A == B",  bitwise: false, outFloat: false, outBool: true,  unary: false, commutative: true  },
    { name: "neq",      format: "A != B",  bitwise: false, outFloat: false, outBool: true,  unary: false, commutative: true  },
    { name: "lt",       format: "A < B",   bitwise: false, outFloat: false, outBool: true,  unary: false, commutative: false },
    { name: "lte",      format: "A <= B",  bitwise: false, outFloat: false, outBool: true,  unary: false, commutative: false },
    { name: "gt",       format: "A > B",   bitwise: false, outFloat: false, outBool: true,  unary: false, commutative: false },
    { name: "gte",      format: "A >= B",  bitwise: false, outFloat: false, outBool: true,  unary: false, commutative: false },
    { name: "and",      format: "A & B",   bitwise: true,  outFloat: false, outBool: false, unary: false, commutative: true  },
    { name: "or",       format: "A | B",   bitwise: true,  outFloat: false, outBool: false, unary: false, commutative: true  },
    { name: "xor",      format: "A ^ B",   bitwise: true,  outFloat: false, outBool: false, unary: false, commutative: true  },
    { name: "not",      format: "~A",      bitwise: true,  outFloat: false, outBool: false, unary: true,  commutative: false },
    { name: "lshift",   format: "A << B",  bitwise: true,  outFloat: false, outBool: false, unary: false, commutative: false },
    { name: "rshift",   format: "A >> B",  bitwise: true,  outFloat: false, outBool: false, unary: false, commutative: false },
    { name: "urshift",  format: "A >>> B", bitwise: true,  outFloat: false, outBool: false, unary: false, commutative: false }
];

var topLevel = [
    { hxName: "panic",  goName: "panic",    returnType: "Void",     types: [],    pure: false, isOverload: false, args: [ { name: "v", type: "Any" } ] },
    { hxName: "len",    goName: "len",      returnType: "GoInt",    types: ["T"], pure: true,  isOverload: false, args: [ { name: "v", type: "T" } ] },
    { hxName: "append", goName: "append",   returnType: "Slice<T>", types: ["T"], pure: false, isOverload: false, args: [ { name: "s", type: "Slice<T>" }, { name: "v", type: "haxe.Rest<T>" } ] },
    { hxName: "copy",   goName: "copy",     returnType: "GoInt",    types: ["T"], pure: false, isOverload: false, args: [ { name: "dst", type: "Slice<T>" }, { name: "src", type: "Slice<T>" } ] },
    { hxName: "cap",    goName: "cap",      returnType: "GoInt",    types: ["T"], pure: true,  isOverload: false, args: [ { name: "v", type: "Slice<T>" } ] },
];

var path = Path.join([Sys.getCwd(), 'std/go']);

function toModuleName(str: String) {
    var count = isUnsigned(str) ? 2 : 1;
    var res = str.substring(0, count).split('').map(c -> c.toUpperCase()).join('') + str.substring(count);

    return switch(res) {
        case 'Int': 'GoInt';
        case 'UInt': 'GoUInt';
        case _: res;
    }
}

function getPrecision(t: String) {
    var pos = t.length - 1;

    while (pos > 0) {
        var char = t.charAt(pos);
        if (Std.parseInt(char) == null) {
            break;
        }

        pos--;
    }

    if (pos == t.length - 1) {
        return isFloatType(t) ? 64 : 32;
    }

    return Std.parseInt(t.substring(pos + 1));
}

function isBaseType(t: String) {
    return t == "int" || t == "float";
}

function isFloatType(t: String) {
    return t.toLowerCase().contains('float');
}

function isUnsigned(t: String) {
    return t.toLowerCase().startsWith('u');
}

function main() {
    for (t in types) {
        var module = toModuleName(t);
        var path = Path.join([ path, '$module.hx' ]);
        var content = new StringBuf();

        content.add('package go;\n\n');
        content.add('// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------\n');
        content.add('// Please invoke the generator using `haxe ./scripts/GenStdTypes.hxml` from the project root\n');
        content.add('// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------\n\n');
        content.add('@:coreType\n');
        content.add('@:notNull\n');
        content.add('@:runtimeValue\n');
        content.add('abstract $module {\n');

        // info
        var isFloat = isFloatType(module);
        var precision = getPrecision(module);
        var signed = !isUnsigned(module);

        // operator overloads
        for (op in operators) {
            if (op.bitwise && isFloat) continue;

            var returnType = if (op.outFloat) 'Float64';
            else if (op.outBool) 'Bool';
            else module;

            var args = if (op.unary) '';
            else 'other: ${module}';

            // go op variant
            switch (op.name) {
                case "div" if (returnType != module):
                    content.add('   @:op(${op.format}) private inline function ${op.name}(${args}): ${returnType} {\n');
                    content.add('       return (this:${returnType}) / (other:${returnType});\n');
                    content.add('   }\n');
                case _:
                    content.add('   @:op(${op.format}) private function ${op.name}(${args}): ${returnType};\n');
            }

            // haxe op variant
            if (op.unary) continue; // not required for unary ops
            var opChar = op.format.replace("A", "").replace("B", "").trim();

            if (op.commutative) {
                content.add('   @:op(${op.format}) @:commutative private inline function hx_${op.name}_a(other: Float): ${returnType} {\n');
                content.add('       return this ${opChar} Go.$t(other);\n');
                content.add('   }\n');
                content.add('   @:op(${op.format}) @:commutative private inline function hx_${op.name}_b(other: Int): ${returnType} {\n');
                content.add('       return this ${opChar} Go.$t(other);\n');
                content.add('   }\n');
            } else {
                if (!op.bitwise) {
                    content.add('   @:op(${op.format}) private inline static function hx_${op.name}_a(a: Float, b: ${module}): ${returnType} {\n');
                    content.add('       return Go.$t(a) ${opChar} b;\n');
                    content.add('   }\n');
                    content.add('   @:op(${op.format}) private inline static function hx_${op.name}_b(a: ${module}, b: Float): ${returnType} {\n');
                    content.add('       return a ${opChar} Go.$t(b);\n');
                    content.add('   }\n');
                }
                content.add('   @:op(${op.format}) private inline static function hx_${op.name}_c(a: Int, b: ${module}): ${returnType} {\n');
                content.add('       return Go.$t(a) ${opChar} b;\n');
                content.add('   }\n');
                content.add('   @:op(${op.format}) private inline static function hx_${op.name}_d(a: ${module}, b: Int): ${returnType} {\n');
                content.add('       return a ${opChar} Go.$t(b);\n');
                content.add('   }\n');
            }
        }

        // @:from functions
        var fromTypes = ['Int'];
        for (f in types) {
            if (isFloatType(f)) continue;
            if (getPrecision(f) == precision && !isFloat && !isBaseType(f)) continue;

            fromTypes.push(
                toModuleName(f)
            );
        }

        if (isFloat) {
            fromTypes.push('Float');

            for (f in types) {
                if (!isFloatType(f)) continue;
                if (getPrecision(f) == precision && isFloat && !isBaseType(f)) continue;

                fromTypes.push(
                    toModuleName(f)
                );
            }
        }

        for (f in fromTypes) {
            content.add('   @:from public static inline function from${f}(x: ${f}): $module {\n');
            content.add('       return Go.$t(x);\n');
            content.add('   }\n');
        }

        // @:to functions
        var toTypes = ["Float"];
        if (!isFloat) {
            toTypes.push("Int");
        }

        for (t in toTypes) {
            content.add('   @:to public inline function to${t}(): $t {\n');
            content.add('       return (untyped this : $t);\n');
            content.add('   }\n');
        }

        // end
        content.add('}');

        File.saveContent(path, content.toString());
    }

    var convPath = Path.join([ path, 'Go.hx' ]);
    var convContent = new StringBuf();

    convContent.add('package go;\n\n');
    convContent.add('// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------\n');
    convContent.add('// Please invoke the generator using `./Scripts/GenStdTypes` from the project root\n');
    convContent.add('// ------------------------ THIS FILE HAS BEEN GENERATED! ------------------------\n\n');
    convContent.add('@:go.TypeAccess({ topLevel: true, transformName: false })\n');
    convContent.add('extern class Go {\n');

    for (t in types) {
        var module = toModuleName(t);
        convContent.add('   @:pure static function $t(x: Any): $module;\n');
    }

    for (tl in topLevel) {
        if (tl.goName != tl.hxName) convContent.add('   @:native("${tl.goName}")\n');
        convContent.add('   ${tl.pure ? '@:pure ' : ''}static ${tl.isOverload ? 'overload ' : ''}function ${tl.hxName}${tl.types.length > 0 ? '<${tl.types.join(", ")}>' : ''}(${tl.args.map(a -> '${a.name}: ${a.type}').join(", ")}): ${tl.returnType};\n');
    }

    convContent.add('}');

    File.saveContent(convPath, convContent.toString());
}
