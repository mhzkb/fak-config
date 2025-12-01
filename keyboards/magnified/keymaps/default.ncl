let {tap, hold, combo, macro, LT, ..} = import "fak/keycode.ncl" in

let kc = tap.reg.kc in
let md = hold.reg.mod in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in
let MO = hold.reg.layer in

let cu = {
    AGUI = md.lgui & kc.A & hold.reg.behavior {},
    SALT = md.lalt & kc.S & hold.reg.behavior {},
    #DSFT = md.lsft & kc.D & hold.reg.behavior {},
    DSFT = LT {} 3 kc.D & hold.reg.mod.lsft,
    FCTL = md.lctl & kc.F & hold.reg.behavior {},
    JCTL = md.rctl & kc.J & hold.reg.behavior {},
    #KSFT = md.rsft & kc.K & hold.reg.behavior {},
    KSFT = LT {} 2 kc.K & hold.reg.mod.rsft,
    LALT = md.ralt & kc.L & hold.reg.behavior {},
    # Layer tap
    ENT_NUM = MO 1 & kc.ENT & hold.reg.behavior{},

    BOOT = tap.custom.fak.BOOT,
} in

# Adapted from https://github.com/bgkendall/
# For modified layers (that emulate key overrides), cancel the modifier before pressing the key and
# reinstate the modifier when done. (This can result in a stuck modifier in some cases, which is
# why we have Reset on the Meta layer!)
let LiftMod_Taps = fun modifier keys => macro.make (
                                                    [ macro.release modifier ] @
                                                    std.array.map (fun key => macro.press key) keys @
                                                    [ macro.pause_for_release ] @
                                                    std.array.map (fun key => macro.release key) keys @
                                                    [ macro.press modifier ]
                                                   ) in
let LiftMod_Tap  = fun modifier key => LiftMod_Taps modifier [key] in

let SpaceBack = LiftMod_Tap md.rsft kc.BSPC in
let SpaceEnter = LiftMod_Tap md.lsft kc.ENT in

let baseLayer = [
            kc.Q,    kc.W,    kc.E,    kc.R,    kc.T,    cu.ENT_NUM,kc.BSPC,  kc.Y,   kc.U,    kc.I,    kc.O,    kc.P,
            cu.AGUI, cu.SALT, cu.DSFT, cu.FCTL, kc.G,               kc.TAB,   kc.H,   cu.JCTL, cu.KSFT, cu.LALT, kc.ESC,
            kc.Z,    kc.X,    kc.C,    kc.V,    kc.B,    kc.SPC,    kc.BSPC,   kc.N,   kc.M,    kc.COMM, kc.DOT,  kc.SLSH,

            # Combos
            cu.BOOT,
            tap.custom.mouse.BTN1,
            tap.custom.mouse.BTN2,
            tap.custom.mouse.BTN3,
            tap.custom.mouse.BTN4,
            tap.custom.mouse.BTN5,

        ] in

let numLayer = [
            TTTT, TTTT,    TTTT,    TTTT,    TTTT,    TTTT,      TTTT,     TTTT,   kc.N7,   kc.N8,   kc.N9,   TTTT,
            TTTT,    TTTT,    TTTT,    TTTT,    TTTT,               TTTT,     TTTT,   kc.N4,   kc.N5,   kc.N6,   kc.N0,
            TTTT,    TTTT,    TTTT,    TTTT,    TTTT,    TTTT,      TTTT,     TTTT,   kc.N1,   kc.N2,   kc.N3,   TTTT,

            # Combos
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
        ] in

let rShiftedBaseLayer  = [
            TTTT, TTTT,    TTTT,    TTTT,    TTTT,    TTTT,      TTTT,     TTTT,   TTTT,   TTTT,   TTTT,   TTTT,
            TTTT,    TTTT,    TTTT,    TTTT,    TTTT,               TTTT,     TTTT,   TTTT,   TTTT,   TTTT,   TTTT,
            TTTT,    TTTT,    TTTT,    TTTT,    TTTT,    SpaceBack,      TTTT,     TTTT,   TTTT,   TTTT,   TTTT,   TTTT,

            # Combos
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
        ] in
let lShiftedBaseLayer  = [
            TTTT, TTTT,    TTTT,    TTTT,    TTTT,    TTTT,      TTTT,     TTTT,   TTTT,   TTTT,   TTTT,   TTTT,
            TTTT,    TTTT,    TTTT,    TTTT,    TTTT,               TTTT,     TTTT,   TTTT,   TTTT,   TTTT,   TTTT,
            TTTT,    TTTT,    TTTT,    TTTT,    TTTT,    SpaceEnter,      TTTT,     TTTT,   TTTT,   TTTT,   TTTT,   TTTT,

            # Combos
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
        ] in
{
    virtual_keys = [
        combo.make 50 [0, 11],
        combo.make 50 [8, 9],
        combo.make 50 [9, 10],
        combo.make 50 [8, 9, 10],
        combo.make 50 [8, 10],
        combo.make 50 [8, 11],
    ],
    layers = [
        baseLayer,
        numLayer,
        rShiftedBaseLayer,
        lShiftedBaseLayer,
    ]
}
