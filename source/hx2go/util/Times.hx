package hx2go.util;

using StringTools;

private class Timer {
    public var total:Float = 0;
    public var pauses:Float = 0;
    public var calls:Int = 0;

    public function new() {}
}

private class Node {
    public var name:String;
    public var parent:Node;
    public var self:Float = 0;
    public var calls:Int = 0;
    public var children:Array<Node> = [];
    public var time:Float = 0;
    public var blankCalls:Bool = false;

    public function new(name:String, parent:Node) {
        this.name = name;
        this.parent = parent;
    }
}

class Times {

    static inline var MIN_PRINT_THRESHOLD = 0.0005;

    public var enabled(default, null):Bool;

    var timers:Map<String, Timer>;
    var current:Timer;
    var startTime:Float;

    public function new(enabled:Bool) {
        this.enabled = enabled;
        this.timers = new Map();
        this.current = new Timer();
        this.startTime = Sys.time();
    }

    public function start(id:String):() -> Void {
        if (!enabled) return () -> {};

        var timer = timers.get(id);
        if (timer == null) {
            timer = new Timer();
            timers.set(id, timer);
        }
        timer.calls++;

        var begin = Sys.time();
        var parent = current;
        current = timer;

        return () -> {
            var dt = Sys.time() - begin;
            timer.total += dt - timer.pauses;
            timer.pauses = 0;
            parent.pauses += dt;
            current = parent;
        };
    }

    public function report(print:String -> Void):Void {
        if (!enabled) return;

        var wall = Sys.time() - startTime;
        var root = buildTree();
        root.time = wall;

        // children too small to print individually
        collapseMisc(root);

        var rows:Array<{ label:String, node:Node }> = [];
        collectRows(root, 0, rows);

        var nameWidth = 4;
        for (r in rows) if (r.label.length > nameWidth) nameWidth = r.label.length;

        print(header(nameWidth));
        for (r in rows) {
            if (r.node.time < MIN_PRINT_THRESHOLD) continue;
            print(rowFor(nameWidth, r.label, r.node));
        }
        print(totalRow(nameWidth, root));
    }

    function buildTree():Node {
        var root = new Node("", null);
        var nodes = new Map<String, Node>();

        for (id in timers.keys()) {
            var timer = timers.get(id);
            var parent = root;
            var path = "";
            for (part in id.split(".")) {
                path = path == "" ? part : path + "." + part;
                var node = nodes.get(path);
                if (node == null) {
                    node = new Node(part, parent);
                    nodes.set(path, node);
                    parent.children.push(node);
                }
                parent = node;
            }
            parent.self += timer.total;
            parent.calls += timer.calls;
        }

        inclusive(root);
        return root;
    }

    // inclusive time/calls = self plus subtree, then sort children
    static function inclusive(node:Node):Void {
        var time = node.self;
        var calls = node.calls;
        for (c in node.children) {
            inclusive(c);
            time += c.time;
            calls += c.calls;
        }
        node.time = time;
        node.calls = calls;
        node.children.sort((a, b) -> a.time > b.time ? -1 : (a.time < b.time ? 1 : 0));
    }

    static function collapseMisc(node:Node):Void {
        for (c in node.children) collapseMisc(c);

        if (node.children.length == 0) return;

        var kept:Array<Node> = [];
        var keptTime = 0.0;
        var miscTime = 0.0;
        var miscCalls = 0;
        var miscCount = 0;
        for (c in node.children) {
            if (c.time < MIN_PRINT_THRESHOLD) {
                miscTime += c.time;
                miscCalls += c.calls;
                miscCount++;
            } else {
                kept.push(c);
                keptTime += c.time;
            }
        }

        if (miscCount > 0 && miscTime >= MIN_PRINT_THRESHOLD) {
            var misc = new Node("misc", node);
            misc.self = miscTime;
            misc.time = miscTime;
            misc.calls = miscCalls;
            kept.push(misc);
            keptTime += miscTime;
        } else if (miscCount > 0) {
            // Too small to show on its own; fold into the untimed remainder below.
            keptTime += miscTime;
        }

        var untimed = node.time - keptTime;
        if (untimed >= MIN_PRINT_THRESHOLD) {
            var rem = new Node(node.parent == null ? "(untimed)" : "(self)", node);
            rem.self = untimed;
            rem.time = untimed;
            rem.calls = 0;
            rem.blankCalls = true;
            kept.push(rem);
        }

        kept.sort((a, b) -> a.time > b.time ? -1 : (a.time < b.time ? 1 : 0));
        node.children = kept;
    }

    static function collectRows(node:Node, depth:Int, out:Array<{ label:String, node:Node }>):Void {
        for (c in node.children) {
            out.push({ label: "".rpad(" ", depth * 2) + c.name, node: c });
            collectRows(c, depth + 1, out);
        }
    }

    static function header(nameWidth:Int):String {
        return "name".rpad(" ", nameWidth) + " | time(s) |   % |  p% |      #";
    }

    static function rowFor(nameWidth:Int, label:String, node:Node):String {
        var pctRoot = node.parent == null ? 100.0 : node.time * 100 / rootOf(node).time;
        var pctParent = node.parent == null || node.parent.time == 0 ? pctRoot : node.time * 100 / node.parent.time;
        return label.rpad(" ", nameWidth)
            + " | " + fixed(node.time, 3).lpad(" ", 7)
            + " | " + Std.string(Math.round(pctRoot)).lpad(" ", 3)
            + " | " + Std.string(Math.round(pctParent)).lpad(" ", 3)
            + " | " + (node.blankCalls ? "" : Std.string(node.calls)).lpad(" ", 6);
    }

    static function totalRow(nameWidth:Int, root:Node):String {
        return "total".rpad(" ", nameWidth)
            + " | " + fixed(root.time, 3).lpad(" ", 7)
            + " | " + "100".lpad(" ", 3)
            + " | " + "100".lpad(" ", 3)
            + " | " + "".lpad(" ", 6);
    }

    static function rootOf(node:Node):Node {
        var n = node;
        while (n.parent != null) n = n.parent;
        return n;
    }

    static function fixed(v:Float, decimals:Int):String {
        var scale = Math.pow(10, decimals);
        var s = Std.string(Math.round(v * scale) / scale);
        var dot = s.indexOf(".");
        if (dot == -1) return s + "." + "".rpad("0", decimals);
        var frac = s.length - dot - 1;
        return frac < decimals ? s.rpad("0", s.length + (decimals - frac)) : s;
    }
}
