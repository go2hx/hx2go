package parser.dump;

import haxe.macro.Expr;

using StringTools;

// TODO:
// - cf_expr needs to have proper type
// - cf_overloads must be checked if the type is valid.
// - swap out strings for enums where possible
// - params need their own struct

typedef RecordSection = Map<String, Dynamic>;

@:structInit
class RecordClass {
    public var _path:String;
    public var cl_path: Null<String> = null;
    public var cl_module: Null<String> = null;
    public var cl_pos: Null<Position> = null;
    public var cl_name_pos: Null<Position> = null;
    public var cl_private: Bool = false;
    public var cl_doc: Null<String> = null;
    public var cl_meta: Array<String> = [];
    public var cl_flags: Array<String> = [];
    public var cl_params: Array<Dynamic> = [];
    public var cl_kind: Null<String> = null;
    public var cl_super: Null<String> = null;
    public var cl_implements: Array<String> = [];
    public var cl_array_access: Null<String> = null;
    public var cl_init: Null<String> = null;
    public var cl_constructor: Null<String> = null;
    public var cl_ordered_fields: Array<RecordClassField> = [];
    public var cl_ordered_statics: Array<RecordClassField> = [];
}

@:structInit
class RecordClassField {
    public var cf_name: Null<String> = null;
    public var cf_doc: Null<String> = null;
    public var cf_type: Dynamic = null;
    public var cf_pos: Null<Position> = null;
    public var cf_name_pos: Null<Position> = null;
    public var cf_meta: Array<String> = [];
    public var cf_kind: Null<String> = null;
    public var cf_params: Array<Dynamic> = [];
    public var cf_expr: Expr = null;
    public var cf_flags: Array<String> = [];
    public var cf_overloads: Array<RecordClassField> = [];
}
 /**
 * Creates a new parser for record dump output (``-D dump=record``)
 * @param input The input string of the input content
 * @param path The file path for debugging info.
 */
@:structInit
class RecordParser {

    private var _input: String;
    private var _path: String;

    /**
     * Parses a block with key-value constructions.
     * @param input The string input of a block section including the braces.
     * @return A generic section of the section
     */
    public function parseBlock(input: String): RecordSection {
        var result: RecordSection = [];
        result["_path"] = _path;
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

                case _ if (key.endsWith("_doc")):
                    var result = parseDoc(lines, line, value);
                    line = result.lastLine;
                    result.value;

                case _ if (key == "cl_ordered_statics" || key == "cl_ordered_fields"):
                    var result = parseList(lines, line, value);
                    line = result.lastLine;
                    result.value.map(item -> mapConcrete(item, RecordClassField));

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
            line++;
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
        var file = value.substring(0, value.indexOf(":"));
        var posRange = value.substring(value.indexOf(":") + 1, value.length).split("-");
        return {
            file: file,
            min: Std.parseInt(posRange[0]),
            max: Std.parseInt(posRange[1])
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
        var skipToNextLine = false;

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
            if (skipToNextLine) {
                skipToNextLine = false;
                line++;
                continue;
            }

            var itemComplete = false;
            for (i in 0...currentLine.length) {
                var char = currentLine.charAt(i);

                switch (char) {
                    case "{", "[":
                        depth++;

                    case "}":
                        depth--;
                        if (depth == 1) {
                            currentItem.push(currentLine);
                            items.push(parseBlock(currentItem.join("\n")));
                            currentItem = [];
                            itemComplete = true;
                            break;
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

            if (depth > 1 && !itemComplete) {
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
    public function parseMultilineString(lines: Array<String>, entryLine: Int, value: String, semicolonNoIndent: Bool = false): { value: Array<String>, lastLine: Int } {
        // semicolonNoIndent is used to check if the semicolon has no indentation before it, if it does, it is not considered the end of the multiline string.
        var indentLevel = 0;
        for (i in 0...lines[entryLine].length) {
            if (lines[entryLine].charAt(i) == " ") indentLevel++;
            else break;
        }

        lines[entryLine] = lines[entryLine].substring(lines[entryLine].indexOf("=") + 1).trim();

        var outLines = [];
        for (i in entryLine...lines.length) {
            var currentLine: String = lines[i];
            var currentIndent = 0;
            for (j in 0...currentLine.length) {
                if (currentLine.charAt(j) == " ") currentIndent++;
                else break;
            }

            outLines.push(currentLine);

            if (currentLine.trim().endsWith(";") && (semicolonNoIndent || currentIndent == 0)) {
                if (i + 1 < lines.length) {
                    var nextLine = lines[i + 1];
                    var nextIndent = 0;
                    for (j in 0...nextLine.length) {
                        if (nextLine.charAt(j) == " ") nextIndent++;
                        else break;
                    }

                    if (nextIndent == indentLevel && nextLine.indexOf("=") != -1 && !nextLine.contains("{") && !nextLine.contains("[")) {
                        break;
                    }
                } else {
                    break;
                }
            }
        }

        return {
            value: outLines,
            lastLine: entryLine + outLines.length - 1
        };
    }

    /**
     * Parses a doc string
     * @param lines List of lines
     * @param entryLine the entry point where the string begins
     * @param value The value of the entry point (from the key = value format)
     * @return String
     */
    public function parseDoc(lines: Array<String>, entryLine: Int, value: String): { value: String, lastLine: Int } {
        var result = parseMultilineString(lines, entryLine, value, true);
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
    public function parseExpr(lines: Array<String>, entryLine: Int, value: String): { value: Expr, lastLine: Int } {
        if (value == "None") {
            return {
                value: macro @:noneExpr() {},
                lastLine: entryLine
            };
        }
        
        var result = parseMultilineString(lines, entryLine, value);
        return {
            value: new ExprParser(_path).parse(result.value),
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
        var inst = Type.createEmptyInstance(concrete);
        for (field in Reflect.fields(inst)) {
            if (!map.exists(field)) {
                continue;
            }

            Reflect.setField(inst, field, map.get(field));
        }

        return inst;
    }

    /**
     * Run the record parser on the given input.
     * @return RecordClass
     */
    public function run(): RecordClass {
        return mapConcrete(
            parseBlock(_input),
            RecordClass
        );
    }

}