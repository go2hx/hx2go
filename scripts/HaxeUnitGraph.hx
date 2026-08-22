import go.github_com.go_echarts.go_echarts.v2.Types;
import go.time.Time as TimeType;
import go.Int64;
import go.Go;
import go.Time_ as Time;
import go.github_com.go_echarts.go_echarts.v2.Charts;
import go.github_com.go_echarts.go_echarts.v2.Opts;

import sys.io.File;
import sys.FileSystem;

@:go.Type({ name: "render", instanceName: "render.render", imports: ["github.com/go-echarts/snapshot-chromedp/render"] })
extern class SnapshotRender {
	@:native("MakeChartSnapshot") static function makeChartSnapshot(content: go.Slice<go.Byte>, image: String): (go.Error);
}

class Record {
	public var time:Float;
	public var total:Int;
	public var passed:Int;
	public var failed:Int;
	public var errored:Int;

	public function new(time:Float, total:Int, passed:Int, failed:Int, errored:Int) {
		this.time = time;
		this.total = total;
		this.passed = passed;
		this.failed = failed;
		this.errored = errored;
	}
}

function main() {
	var input = "unittests.json";
	var output = "graph.png";
	if (Sys.args().length > 0)
		input = Sys.args()[0];
	if (Sys.args().length > 1)
		output = Sys.args()[1];

	if (!FileSystem.exists(input)) {
		Sys.println('HaxeUnitGraph: history file not found: $input');
		Sys.exit(1);
	}

	var records = parseHistory(File.getContent(input));
	if (records.length == 0) {
		Sys.println("HaxeUnitGraph: no records in history, nothing to graph");
		Sys.exit(1);
	}

	var maxTotal = 0;
	for (r in records)
		if (r.total > maxTotal)
			maxTotal = r.total;
	// headroom above the largest series so the top band isn't clipped
	var yMax = maxTotal + Std.int(Math.max(5, maxTotal * 0.1));

	var passedColor = "#3BA55D"; // green
	var failedColor = "#C0344E"; // red
	var erroredColor = "#8B5CF6"; // purple — complements the red for crashes

	var line = Charts.newLine();
	line.setGlobalOptions(
		Charts.withInitializationOpts({
			theme: Types.themeChalk, // dark theme
			backgroundColor: "#1E1E28",
			width: "1400px",
			height: "700px",
		}),
		// paint immediately for screenshot
		Charts.withAnimation(false),
		Charts.withYAxisOpts({
			name: "Number of tests",
			min: 0,
			max: yMax,
		}),
		Charts.withXAxisOpts({
			type: "time",
			name: "Time",
		}),
		Charts.withLegendOpts({
			show: Opts.bool(true),
			right: "3%",
			top: "2%",
		}),
		Charts.withTooltipOpts({
			show: Opts.bool(true),
			trigger: "axis",
		}),
	);

	line.addSeries("Passed Methods", [for (r in records) {
		value: [Time.unixMilli(Go.int64(r.time)).UTC(), r.passed],
	}],
		Charts.withLineChartOpts({ stack: "tests", smooth: Opts.bool(false), step: "start" }),
		Charts.withAreaStyleOpts({ opacity: Opts.float(0.9) }),
		Charts.withItemStyleOpts({ color: passedColor })
	);
	line.addSeries("Failed Methods", [for (r in records) {
		value: [Time.unixMilli(Go.int64(r.time)).UTC(), r.failed],
	}],
		Charts.withLineChartOpts({ stack: "tests", smooth: Opts.bool(false), step: "start" }),
		Charts.withAreaStyleOpts({ opacity: Opts.float(0.9) }),
		Charts.withItemStyleOpts({ color: failedColor })
	);
	line.addSeries("Errored Methods (caught throw)", [for (r in records) {
		value: [Time.unixMilli(Go.int64(r.time)).UTC(), r.errored],
	}],
		Charts.withLineChartOpts({ stack: "tests", smooth: Opts.bool(false), step: "start" }),
		Charts.withAreaStyleOpts({ opacity: Opts.float(0.9) }),
		Charts.withItemStyleOpts({ color: erroredColor })
	);

	// Rasterise the chart to a PNG via snapshot-chromedp (headless Chrome).
	// retry a few times before giving up.
	var content = line.renderContent();
	var attempts = 4;
	var err:go.Error = null;
	for (attempt in 1...attempts + 1) {
		err = SnapshotRender.makeChartSnapshot(content, output);
		if (err == null)
			break;
		Sys.println('HaxeUnitGraph: snapshot attempt $attempt/$attempts failed: ${err.error()}');
		if (attempt < attempts) {
			// brief backoff to let a transiently-slow/starved Chrome recover
			Sys.sleep(3);
		}
	}
	if (err != null) {
		Sys.println('HaxeUnitGraph: snapshot failed after $attempts attempts: ${err.error()}');
		Sys.exit(1);
	}
	Sys.println('HaxeUnitGraph: wrote ${haxe.io.Path.join([Sys.getCwd(), output])} from ${records.length} record(s)');
}

function parseHistory(raw:String):Array<Record> {
	var out:Array<Record> = [];
	var depth = 0;
	var start = -1;
	for (i in 0...raw.length) {
		var c = raw.charCodeAt(i);
		if (c == "{".code) {
			if (depth == 0)
				start = i;
			depth++;
		} else if (c == "}".code) {
			depth--;
			if (depth == 0 && start != -1) {
				var obj = raw.substring(start, i + 1);
				out.push(new Record(
					readNumber(obj, "time"),
					Std.int(readNumber(obj, "total")),
					Std.int(readNumber(obj, "passed")),
					Std.int(readNumber(obj, "failed")),
					Std.int(readNumber(obj, "errored"))
				));
				start = -1;
			}
		}
	}
	return out;
}

// readNumber from json field
function readNumber(obj:String, key:String):Float {
	var needle = '"' + key + '"';
	var k = obj.indexOf(needle);
	if (k == -1)
		return 0;
	var i = k + needle.length;
	// skip whitespace and the colon
	while (i < obj.length) {
		var c = obj.charCodeAt(i);
		if (c == ":".code || c == " ".code || c == "\t".code) {
			i++;
		} else {
			break;
		}
	}
	var startNum = i;
	while (i < obj.length) {
		var c = obj.charCodeAt(i);
		var isDigit = c >= "0".code && c <= "9".code;
		if (isDigit || c == "-".code || c == ".".code || c == "e".code || c == "E".code || c == "+".code) {
			i++;
		} else {
			break;
		}
	}
	var num = obj.substring(startNum, i);
	var v = Std.parseFloat(num);
	return Math.isNaN(v) ? 0 : v;
}
