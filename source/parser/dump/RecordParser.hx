package parser.dump;

import haxe.macro.Expr;

using StringTools;

// TODO:
// - cf_expr needs to have proper type
// - cf_overloads must be checked if the type is valid.
// - swap out strings for enums where possible
// - params need their own struct

typedef RecordSection = Map<String, Dynamic>;

enum RecordEntryKind {
    RUnknown;
    RAbstract;
    RType;
    REnum;
    RClass;
}

/**
 * Shared across both Class and Abstract
 */
class RecordEntry {
    public var record_kind: RecordEntryKind = RUnknown;
    public var record_debug_path: String;
    public var path: Null<String>;
    public var module: Null<String>;
    public var pos: Null<Position> = null;
    public var name_pos: Null<Position> = null;
    public var _private: Bool = false;
    public var doc: Null<String> = null;
    public var meta: Array<String> = [];
    public var params: Array<Map<String, Dynamic>> = [];
    // specialised variants
    public function toClass(): RecordClass return cast (this, RecordClass);
    public function toAbstract(): RecordAbstract return cast (this, RecordAbstract);
    public function toType(): RecordType return cast (this, RecordType);
    public function toEnum(): RecordEnum return cast (this, RecordEnum);
    public function new() {}
}

class RecordClass extends RecordEntry {
    public var flags: Array<String> = [];
    public var kind: Null<String> = null;
    public var _super: Null<String> = null;
    public var _implements: Array<String> = [];
    public var array_access: Null<String> = null;
    public var init: Null<String> = null;
    public var constructor: Map<String, Dynamic> = null;
    public var ordered_fields: Array<RecordClassField> = [];
    public var ordered_statics: Array<RecordClassField> = [];
}

class RecordType extends RecordEntry {
    public var type:String = "";
}

class RecordEnum extends RecordEntry {}

class RecordAbstract extends RecordEntry {
    public var ops: Array<Dynamic> = [];
    public var unops: Array<Dynamic> = [];
    public var impl: Null<String> = null;
    public var _this: Null<String> = null;
    public var from: Array<String> = [];
    public var to: Array<String> = [];
    public var from_field: Array<Dynamic> = [];
    public var to_field: Array<Dynamic> = [];
    public var array: Array<Dynamic> = [];
    public var read: Null<String> = null;
    public var write: Null<String> = null;
    public var _default: Null<String> = null;
}

class RecordClassField {
    public var name: Null<String> = null;
    public var doc: Null<String> = null;
    public var type: Dynamic = null;
    public var pos: Null<Position> = null;
    public var name_pos: Null<Position> = null;
    public var meta: Array<String> = [];
    public var kind: Null<String> = null;
    public var params: Array<Dynamic> = [];
    public var expr: HaxeExpr = null;
    public var flags: Array<String> = [];
    public var overloads: Array<RecordClassField> = [];
}
 /**
 * Creates a new parser for record dump output (``-D dump=record``)
 * @param input The input string of the input content
 * @param path The file path for debugging info.
 */
@:structInit
class RecordParser {

    final remapConcrete = [
        "implements" => "_implements",
        "private" => "_private",
        "this" => "_this",
        "default" => "_default",
        "super" => "_super",
        "modules" => "module" // a_modules and cl_module -> module
    ];

    private var input: String;
    private var dbg_path: String;

    /**
     * Parses a block with key-value constructions.
     * @param input The string input of a block section including the braces.
     * @return A generic section of the section
     */
    public function parseBlock(input: String): RecordSection {
        var result: RecordSection = [];
        result["hx2go_record_debug_path"] = dbg_path;

        var lines: Array<String> = input.split("\n");
        var line: Int = 0;

        while (line < lines.length) {
            var currentLine = lines[line].trim();
            if (currentLine == "" || currentLine == "{" || currentLine == "}") {
                line++;
                continue;
            }

            if (currentLine.endsWith(";")) {
                currentLine = currentLine.substring(0, currentLine.length - 1).trim();
            }

            var parts = currentLine.split("=");
            if (parts.length < 2) {
                line++;
                continue;
            }

            var key = parts[0].trim();
            var value = parts.slice(1).join("=").trim();

            var startLine = line;
            var output: Dynamic = switch(0) {
                case _ if (key.endsWith("_meta")):
                    value
                    .substring(1, value.length - 1)
                    .split("@")
                    .filter(s -> s != "")
                    .map(s -> '@${s.trim()}');

                case _ if (key.endsWith("_pos") || key.endsWith("_name_pos")):
                    parsePosition(lines, line, value);

                case _ if (key.endsWith("_flags")):
                    parseFlags(lines, line, value);

                case _ if (key.endsWith("_expr")):
                    var result = parseExpr(lines, line, value);
                    line = result.lastLine;
                    result.value;

                case _ if (key.endsWith("_params")):
                    var result = parseList(lines, line, value);
                    line = result.lastLine;
                    result.value;

                case _ if (key.endsWith("_doc")):
                    var result = parseDoc(lines, line, value);
                    line = result.lastLine;
                    result.value;

                case _ if (key == "cl_ordered_statics" || key == "cl_ordered_fields"):
                    var result = parseList(lines, line, value);
                    line = result.lastLine;
                    result.value.map(item -> mapConcrete(item, RecordClassField));

                case _ if (key == "cl_constructor"):
                    var result = parseField(lines, line, value);
                    line = result.lastLine;
                    result.value;

                case _ if (value == "true" || value == "false"):
                    value == "true";

                case _ if (value.startsWith("[")):
                    var result = parseList(lines, line, value);
                    line = result.lastLine;
                    result.value;

                case _:
                    parseString(lines, line, value);
            }

            result.set(key, output);
            if (line == startLine) {
                line++;
            }
        }
        return result;
    }

    /**
     * Parses a space separated list of flags
     * @param lines List of lines
     * @param entryLine the entry point where the flags begin
     * @param value The value of the entry point (from the key = value format)
     * @return List of flags
     */
    public function parseFlags(lines: Array<String>, entryLine: Int, value: String): Array<String> {
        return value.split(" ");
    }

    /**
     * Parses a position to convert to haxe.macro.Expr's Position
     * @param lines List of lines
     * @param entryLine the entry point where the position begins
     * @param value The value of the entry point (from the key = value format)
     * @return Position
     */
    public function parsePosition(lines: Array<String>, entryLine: Int, value: String): Position {
        var last = value.lastIndexOf(":");
        var file = value.substring(0, last);
        var posRange = value.substring(last + 1).trim().split("-");

        return {
            file: file,
            min: Std.parseInt(posRange[0].trim()),
            max: Std.parseInt(posRange[1].trim())
        };
    }

    /**
     * Parses a string
     * @param lines List of lines
     * @param entryLine the entry point where the string begins
     * @param value The value of the entry point (from the key = value format)
     * @return String
     */
    public function parseString(lines: Array<String>, entryLine: Int, value: String): String {
        return value;
    }

    /**
     * Parses a string
     * @param lines List of lines
     * @param entryLine the entry point where the string begins
     * @param value The value of the entry point (from the key = value format)
     * @return String
     */
    public function parseList(lines: Array<String>, entryLine: Int, value: String): { value: Array<RecordSection>, lastLine: Int } {
        if (value == "[]") {
            return { value: [], lastLine: entryLine };
        }
        var items: Array<RecordSection> = [];
        var line = entryLine;
        var depth = 0;
        var currentItem: Array<String> = [];

        if (value.startsWith("[")) {
            depth = 1;
            var rest = value.substring(1).trim();
            if (rest.length > 0 && rest.charAt(0) == "{") {
                currentItem.push("{");
                depth++;
            }
            line++;
        }

        while (line < lines.length) {
            var currentLine = lines[line];

            for (i in 0...currentLine.length) {
                var char = currentLine.charAt(i);

                switch (char) {
                    case "{", "[":
                        depth++;

                    case "}":
                        depth--;
                        if (depth == 1) {
                            currentItem.push(currentLine.substring(0, i + 1));
                            items.push(parseBlock(currentItem.join("\n")));
                            currentItem = [];
                        }

                    case "]":
                        depth--;
                        if (depth == 0) {
                            if (currentItem.length > 0) {
                                items.push(parseBlock(currentItem.join("\n")));
                            }
                            return { value: items, lastLine: line };
                        }
                }
            }

            if (depth > 1) {
                currentItem.push(currentLine);
            }

            line++;
        }

        return { value: items, lastLine: line };
    }

    /**
     * Parses a multiline string
     * @param lines List of lines
     * @param entryLine the entry point where the string begins
     * @param value The value of the entry point (from the key = value format)
     * @return String
     */
    public function parseMultilineString(lines: Array<String>, entryLine: Int, value: String, ?end: Array<String>): { value: Array<String>, lastLine: Int } {
        if (end == null) {
            end = [";"];
        }

        if (isTerminator(lines[entryLine].trim(), false, end)) {
            return { value: [value], lastLine: entryLine };
        }

        var result: Array<String> = [];
        result.push(value);

        var line = entryLine + 1;
        while (line < lines.length) {
            var currentLine = lines[line];
            if (isTerminator(currentLine.trim(), true, end)) {
                return { value: result, lastLine: line };
            }

            result.push(currentLine);
            line++;
        }

        return { value: result, lastLine: line };
    }

    /**
     * Parses a field block
     * @param lines List of lines
     * @param entryLine the entry point where the field begins
     * @param value The value of the entry point (from the key = value format)
     * @return RecordSection
     */
    public function parseField(lines: Array<String>, entryLine: Int, value: String): { value: RecordSection, lastLine: Int } {
        if (value == "None") {
            return { value: null, lastLine: entryLine };
        }

        var blockLines: Array<String> = [];
        var depth = 0;
        var line = entryLine;

        if (value.contains("{")) {
            depth = 1;
            var startIdx = value.indexOf("{");
            var remaining = value.substring(startIdx + 1).trim();
            if (remaining.length > 0) {
                blockLines.push(remaining);
            }
            line++;
        } else {
            return { value: null, lastLine: entryLine };
        }

        while (line < lines.length && depth > 0) {
            var currentLine = lines[line];

            for (i in 0...currentLine.length) {
                var char = currentLine.charAt(i);
                if (char == "{") {
                    depth++;
                } else if (char == "}") {
                    depth--;
                    if (depth == 0) {
                        var beforeBrace = currentLine.substring(0, i);
                        if (beforeBrace.trim().length > 0) {
                            blockLines.push(beforeBrace);
                        }
                        return {
                            value: parseBlock(blockLines.join("\n")),
                            lastLine: line
                        };
                    }
                }
            }

            if (depth > 0) {
                blockLines.push(currentLine);
            }
            line++;
        }

        return {
            value: parseBlock(blockLines.join("\n")),
            lastLine: line
        };
    }

    /**
     * Checks if a line is a terminator
     * @param line The line to check
     * @param trim Whether to trim the line before checking
     * @param end List of possible terminators
     * @return Bool
     */
    public function isTerminator(line: String, exact: Bool, end: Array<String>): Bool {
        for (terminator in end) {
            if (exact) {
                if (line == terminator) return true;
            } else {
                if (line.endsWith(terminator)) return true;
            }
        }
        return false;
    }

    /**
     * Parses a doc string
     * @param lines List of lines
     * @param entryLine the entry point where the string begins
     * @param value The value of the entry point (from the key = value format)
     * @return String
     */
    public function parseDoc(lines: Array<String>, entryLine: Int, value: String): { value: String, lastLine: Int } {
        var result = parseMultilineString(lines, entryLine, value);
        return {
            value: result.value.join("\n"),
            lastLine: result.lastLine
        };
    }

    /**
     * Parses an expression
     * @param lines List of lines
     * @param entryLine the entry point where the expression begins
     * @param value The value of the entry point (from the key = value format)
     * @return Haxe Expression
     */
    public function parseExpr(lines: Array<String>, entryLine: Int, value: String): { value: HaxeExpr, lastLine: Int } {
        if (value == "None") {
            return {
                value: null,
                lastLine: entryLine
            };
        }

        var result = parseMultilineString(lines, entryLine, value);
        return {
            value: new ExprParser(dbg_path).parse(result.value),
            lastLine: result.lastLine
        };
    }

    /**
     * Maps a dynamic map to a class.
     * @param map The map
     * @param concrete the class type
     * @return Instance of the class type (T)
     */
    public function mapConcrete<T>(map: RecordSection, concrete: Class<T>): T {
        // var inst = Type.createEmptyInstance(concrete);
        // for (field in Reflect.fields(inst)) {
        //     if (!map.exists(field)) {
        //         continue;
        //     }

        //     Reflect.setField(inst, field, map.get(field));
        // }

        var inst = Type.createEmptyInstance(concrete);
        var fields = Type.getInstanceFields(Type.getClass(inst));
        for (key in map.keys()) {
            var field = key.split("_").slice(1).join("_");
            if (remapConcrete.exists(field)) {
                field = remapConcrete.get(field);
            }

            if (fields.contains(field)) Reflect.setField(inst, field, map.get(key));
        }

        return inst;
    }

    /**
     * Run the record parser on the given input.
     * @return RecordClass
     */
    public function run(): RecordEntry {
        var block = parseBlock(input);
        // trace(haxe.Json.stringify(block, null, "  "));

        var recordKind: RecordEntryKind = null;
        var concrete: RecordEntry = switch (0) {
            case _ if (block.exists("cl_path")):
                recordKind = RClass;
                mapConcrete(block, RecordClass);

            case _ if (block.exists("a_path")):
                recordKind = RAbstract;
                mapConcrete(block, RecordAbstract);

            case _ if (block.exists("t_path")):
                recordKind  = RType;
                mapConcrete(block, RecordType);
            case _:
                recordKind = RUnknown;
                mapConcrete(block, RecordEntry);
        }
        concrete.record_kind = recordKind;
        return concrete;
    }

}
