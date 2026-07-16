package unit;

function main() {
    // Local-constructed date: 2021-06-15 10:30:45 local time.
    // Only assert timezone-independent values: local getters read back the
    // same components they were constructed with, and toString formats them.
    var d = new Date(2021, 5, 15, 10, 30, 45);
    assert(d.getFullYear() == 2021);
    assert(d.getMonth() == 5);
    assert(d.getDate() == 15);
    assert(d.getHours() == 10);
    assert(d.getMinutes() == 30);
    assert(d.getSeconds() == 45);
    assert(d.getDay() == 2); // 2021-06-15 is a Tuesday
    assert(d.toString().indexOf("2021-06-15 10:30:45") != -1);

    // fromTime: absolute instant 2021-06-15 12:00:00 UTC.
    // getTime and the UTC getters are timezone-independent.
    var ft = Date.fromTime(1623758400000.0);
    assert(ft.getTime() == 1623758400000.0);
    assert(ft.getUTCFullYear() == 2021);
    assert(ft.getUTCMonth() == 5);
    assert(ft.getUTCDate() == 15);
    assert(ft.getUTCHours() == 12);
    assert(ft.getUTCMinutes() == 0);
    assert(ft.getUTCSeconds() == 0);
    assert(ft.getUTCDay() == 2);

    // fromString with date + time, parsed as local time.
    var fs = Date.fromString("2021-06-15 10:30:45");
    assert(fs.getFullYear() == 2021);
    assert(fs.getMonth() == 5);
    assert(fs.getDate() == 15);
    assert(fs.getHours() == 10);
    assert(fs.getMinutes() == 30);
    assert(fs.getSeconds() == 45);
    assert(fs.toString().indexOf("2021-06-15 10:30:45") != -1);

    // fromString with date only, midnight local time.
    var fs2 = Date.fromString("2021-06-15");
    assert(fs2.getFullYear() == 2021);
    assert(fs2.getMonth() == 5);
    assert(fs2.getDate() == 15);
    assert(fs2.toString().indexOf("2021-06-15 00:00:00") != -1);

    // now: can't assert an exact instant, only sanity bounds.
    var n = Date.now();
    assert(n.getTime() > 0);
    assert(n.getFullYear() >= 2021);
}
