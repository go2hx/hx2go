package main

import "fmt"

func Hx_Field_main_say(s string) {
    var i int = 0; _ = i
    for (i < 5) {
        Hx_Field_sys_sleep(1)
        fmt.Println(s + ", with index: " + fmt.Sprintf("%v", i))
        i++
    }
}

func Hx_Field_main_main() {
    go func() {
        Hx_Field_main_say("world")
    }()
    Hx_Field_main_say("hello")
}

func main() {
    Hx_Field_main_main()
}
