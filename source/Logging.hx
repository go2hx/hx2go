package;

using StringTools;

import haxe.PosInfos;
import sys.io.FileOutput;
import haxe.io.Encoding;

private enum LoggingLevel {
    Debug;
    Info;
    Warn;
    Error;
    Success;
}

class Logging {

    private static var _sources: Map<String, LoggingSource> = [];
    private static var _colours: Map<LoggingLevel, String> = [
        LoggingLevel.Debug => "\x1b[35m",
        LoggingLevel.Info => "\x1b[34m",
        LoggingLevel.Warn => "\x1b[33m",
        LoggingLevel.Error => "\x1b[31m",
        LoggingLevel.Success => "\x1b[32m",
    ];

    public static var recordParser: LoggingSource;
    public static var exprParser: LoggingSource;
    public static var exprTools: LoggingSource;
    public static var preprocessor: LoggingSource;
    public static var transformer: LoggingSource;
    public static var translator: LoggingSource;
    public static var module: LoggingSource;
    public static var context: LoggingSource;
    public static var trace: LoggingSource;
    public static var testing: LoggingSource;

    private static final DIM = "\x1b[2m";
    private static final RESET = "\x1b[0m";

    public static function init(): Void {
        Logging.recordParser = getOrCreateSource("parser.record");
        Logging.exprParser = getOrCreateSource("parser.expr");
        Logging.exprTools = getOrCreateSource("util.expr_tools");
        Logging.preprocessor = getOrCreateSource("pass.preprocessor");
        Logging.transformer = getOrCreateSource("pass.transformer");
        Logging.translator = getOrCreateSource("pass.translator");
        Logging.testing = getOrCreateSource("testing");
        Logging.module = getOrCreateSource("module");
        Logging.context = getOrCreateSource("context");
        Logging.trace = getOrCreateSource("trace");

        haxe.Log.trace = (v: Dynamic, ?posInfos: PosInfos) -> {
            Logging.trace.info(Std.string(v) + (posInfos?.customParams?.length > 0 ? ", " + posInfos?.customParams?.map(v -> Std.string(v)).join(", ") : "" ), posInfos);
        };
    }

    public static var warningCount: Int = 0;
    public static var errorCount: Int = 0;

    public static function getOrCreateSource(name: String): LoggingSource {
        var src = _sources.get(name);
        if (src == null) {
            src = { name: name };
            _sources[name] = src;
        }

        return src;
    }

    public static function finalise(): Bool {
        if (warningCount == 0 && errorCount == 0) {
            return true;
        }

        Sys.println("");

        var summary = 'Compilation ${errorCount == 0 ? 'finished' : 'failed'} with';

        if (warningCount > 0) {
            summary += '${_colours.get(LoggingLevel.Warn)} $warningCount warning(s)${RESET}';
        }

        if (errorCount > 0) {
            if (warningCount > 0) {
                summary += " and";
            }
            summary += '${_colours.get(LoggingLevel.Error)} $errorCount error(s)${RESET}';
        }

        Sys.println(summary + ".");

        return errorCount == 0;
    }

    private static function log(source: LoggingSource, message: String, level: LoggingLevel, ?posInfos: PosInfos): Void {
        if (!source.enabled) {
            return;
        }

        var colour = _colours.get(level);
        var str = colour + Std.string(level).rpad(" ", 5).toUpperCase() + DIM + " | " + source.name + " ";

        if (posInfos != null) {
            str += "(" + posInfos.fileName + ":" + posInfos.lineNumber + ") ";
        }

        str += RESET + message;

        Sys.println(str);

        switch level {
            case Warn: warningCount++;
            case Error: errorCount++;
            case _: null;
        }

        if (source.writer != null) {
            source.writer.writeString('$str\n', Encoding.UTF8);
        }
    }

}

@:structInit
private class LoggingSource {

    public var name: String;
    public var enabled: Bool = true;
    public var writer: Null<FileOutput> = null;

    public function info(message: Dynamic, ?posInfos: PosInfos): Void {
        @:privateAccess Logging.log(this, Std.string(message), LoggingLevel.Info, posInfos);
    }

    public function debug(message: Dynamic, ?posInfos: PosInfos): Void {
        @:privateAccess Logging.log(this, Std.string(message), LoggingLevel.Debug, posInfos);
    }

    public function warn(message: Dynamic, ?posInfos: PosInfos): Void {
        @:privateAccess Logging.log(this, Std.string(message), LoggingLevel.Warn, posInfos);
    }

    public function error(message: Dynamic, ?posInfos: PosInfos): Void {
        @:privateAccess Logging.log(this, Std.string(message), LoggingLevel.Error, posInfos);
    }

    public function success(message: Dynamic, ?posInfos: PosInfos): Void {
        @:privateAccess Logging.log(this, Std.string(message), LoggingLevel.Success, posInfos);
    }

}
