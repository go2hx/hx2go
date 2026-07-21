package hx2go.util;

using StringTools;

class OutputBuffer {
    #if go
    private var content: go.strings.Builder;
    #else
    private var content: String;
    #end
    private var indentLevel: Int;

    private static function indent(str: String, by: Int): String {
        if (by <= 0) return str;
        var pad = StringTools.rpad("", "    ", by * 4);
        var parts = str.split("\n");
        #if go
        var sb: go.strings.Builder = null;
        for (i in 0...parts.length) {
            if (i > 0) sb.writeString("\n");
            sb.writeString(pad);
            sb.writeString(parts[i]);
        }
        return sb.string();
        #else
        var sb = new StringBuf();
        for (i in 0...parts.length) {
            if (i > 0) sb.add("\n");
            sb.add(pad);
            sb.add(parts[i]);
        }
        return sb.toString();
        #end
    }

    public function new(content: String = "", indentLevel: Int = 0) {
        #if go
        this.content.writeString(content);
        #else
        this.content = content;
        #end
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

    public function add(line: String, indentLevelOffset: Int = 0, ?newLine: Bool): Void {
        var text = indent(line, indentLevel + indentLevelOffset) + ((newLine ?? true) ? "\n" : "");
        #if go
        content.writeString(text);
        #else
        content += text;
        #end
    }

    public function addInline(line: String): Void {
        #if go
        content.writeString(line);
        #else
        content += line;
        #end
    }

    // TODO switch back to default value args, once supported
    public function addBuffer(buffer: OutputBuffer, indentLevelOffset: Int = 0, ?newLine: Bool): Void {
        var text = indent(buffer.toString(), indentLevel + indentLevelOffset) + ((newLine ?? true) ? "\n" : "");
        #if go
        content.writeString(text);
        #else
        content += text;
        #end
    }

    public function addBufferInline(buffer: OutputBuffer): Void {
        #if go
        content.writeString(buffer.toString());
        #else
        content += buffer.toString();
        #end
    }

    public function endedWithBlock(): Bool {
        return toString().trim().endsWith("}");
    }

    public function isEmpty(): Bool {
        return toString().trim() == "";
    }

    public function clear(): Void {
        #if go
        content.reset();
        #else
        content = "";
        #end
    }

    public function toString(): String {
        #if go
        return content.string();
        #else
        return content;
        #end
    }
}