package hx2go.util;

using StringTools;

class OutputBuffer {

    private var content: String;
    private var indentLevel: Int;

    private static function indent(str: String, by: Int): String {
        var pad = StringTools.rpad("", "    ", by);

        return str
            .split("\n")
            .map(line -> pad + line)
            .join("\n");
    }

    public function new(content: String = "", indentLevel: Int = 0) {
        this.content = content;
        this.indentLevel = indentLevel;
    }

    public function setIndentLevel(indentLevel: Int): Void {
        this.indentLevel = indentLevel;
    }

    public function incrementIndentLevel(): Void {
        this.indentLevel++;
    }

    public function decrementIndentLevel(): Void {
        this.indentLevel--;
    }

    public function add(line: String, indentLevelOffset: Int = 0, newLine: Bool = true): Void {
        content += indent(line, indentLevel + indentLevelOffset) + (newLine ? "\n" : "");
    }

    public function addInline(line: String): Void {
        content += line;
    }

    public function addBuffer(buffer: OutputBuffer, indentLevelOffset: Int = 0, newLine: Bool = true): Void {
        content += indent(buffer.toString(), indentLevel + indentLevelOffset) + (newLine ? "\n" : "");
    }

    public function addBufferInline(buffer: OutputBuffer): Void {
        content += buffer.toString();
    }

    public function endedWithBlock(): Bool {
        return content.trim().endsWith("}");
    }

    public function clear(): Void {
        content = "";
    }

    public function toString(): String {
        return content;
    }

}
