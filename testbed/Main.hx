function main() {
        // Local-constructed date: 2021-06-15 10:30:45 local time
        var d = new Date(2021, 5, 15, 10, 30, 45);
        trace("=== new Date(2021,5,15,10,30,45) local ===");
        trace("getFullYear=" + d.getFullYear());
        trace("getMonth=" + d.getMonth());
        trace("getDate=" + d.getDate());
        trace("getHours=" + d.getHours());
        trace("getMinutes=" + d.getMinutes());
        trace("getSeconds=" + d.getSeconds());
        trace("getDay=" + d.getDay());
        trace("getTime=" + d.getTime());
        trace("getTimezoneOffset=" + d.getTimezoneOffset());
        trace("toString=" + d.toString());

        trace("=== UTC getters ===");
        trace("getUTCFullYear=" + d.getUTCFullYear());
        trace("getUTCMonth=" + d.getUTCMonth());
        trace("getUTCDate=" + d.getUTCDate());
        trace("getUTCHours=" + d.getUTCHours());
        trace("getUTCMinutes=" + d.getUTCMinutes());
        trace("getUTCSeconds=" + d.getUTCSeconds());
        trace("getUTCDay=" + d.getUTCDay());

        // fromTime: 2021-06-15 12:00:00 UTC = 1623758400 s = 1623758400000 ms
        var ft = Date.fromTime(1623758400000.0);
        trace("=== fromTime(1623758400000) ===");
        trace("getTime=" + ft.getTime());
        trace("getUTCFullYear=" + ft.getUTCFullYear());
        trace("getUTCMonth=" + ft.getUTCMonth());
        trace("getUTCHours=" + ft.getUTCHours());
        trace("getUTCMinutes=" + ft.getUTCMinutes());
        trace("getUTCSeconds=" + ft.getUTCSeconds());
        trace("getUTCDay=" + ft.getUTCDay());
        trace("toString=" + ft.toString());

        // fromString
        var fs = Date.fromString("2021-06-15 10:30:45");
        trace("=== fromString('2021-06-15 10:30:45') ===");
        trace("getFullYear=" + fs.getFullYear());
        trace("getMonth=" + fs.getMonth());
        trace("getHours=" + fs.getHours());
        trace("getMinutes=" + fs.getMinutes());
        trace("getSeconds=" + fs.getSeconds());
        trace("toString=" + fs.toString());

        var fs2 = Date.fromString("2021-06-15");
        trace("=== fromString('2021-06-15') ===");
        trace("getFullYear=" + fs2.getFullYear());
        trace("getMonth=" + fs2.getMonth());
        trace("toString=" + fs2.toString());

        // now
        var n = Date.now();
        trace("=== now ===");
        trace("getFullYear=" + n.getFullYear());
        trace("getTime>0=" + (n.getTime() > 0));
}