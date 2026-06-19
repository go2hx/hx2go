package main

import "fmt"
import "time"

func Hx_Field_sys_println(v any) {
    fmt.Println(v)
}

func Hx_Field_sys_print(v any) {
    fmt.Print(v)
}

func Hx_Field_sys_sleep(seconds float64) {
    var _hx_tmp_0 time.Duration = time.Millisecond; _ = _hx_tmp_0
    time.Sleep(_hx_tmp_0 * time.Duration(int64(seconds * float64(1000))))
}
