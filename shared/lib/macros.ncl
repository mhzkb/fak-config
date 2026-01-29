let { tap, macro, ..} = import "fak/keycode.ncl" in
let kc = tap.reg.kc in
let ms = tap.custom.mouse in

{
# Send Drag Scroll macro to trackball
DRAG_SCROLL_TG = macro.make [
    macro.tap kc.NUM,
    macro.wait 20,
    macro.tap kc.NUM,
    ],

DRAG_SCROLL = macro.make [
    macro.tap kc.NUM,
    macro.wait 20,
    macro.tap kc.NUM,
    macro.pause_for_release,
    macro.tap kc.NUM,
    macro.wait 20,
    macro.tap kc.NUM,
    ],

DOUBLE_CLICK = macro.make [
    macro.press ms.BTN1,
    macro.wait 20,
    macro.release ms.BTN1,
    macro.wait 50,
    macro.press ms.BTN1,
    macro.wait 20,
    macro.release ms.BTN1,
    ],

}