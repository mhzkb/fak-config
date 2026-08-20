let {tap, hold, combo, encoder, ..} = import "fak/keycode.ncl" in
let dk = import "lib/danish.ncl" in
let mc = import "lib/macros.ncl" in

# Common aliases
let kc = tap.reg.kc in
let ks = tap.reg.ks in
let md = hold.reg.mod in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in
let MO = hold.reg.layer in
let ms = tap.custom.mouse in

# Home row mods
let hrm = {
    LGUI = md.lgui & kc.A & hold.reg.behavior {},
    LALT = md.lalt & kc.S & hold.reg.behavior {},
    LSFT = md.lsft & kc.D & hold.reg.behavior {},
    LCTL = md.lctl & kc.F & hold.reg.behavior {},
    
    RCTL = md.rctl & kc.J & hold.reg.behavior {},
    RSFT = md.rsft & kc.K & hold.reg.behavior {},
    RALT = md.ralt & kc.L & hold.reg.behavior {},
    RGUI = md.rgui & dk.QUOT & hold.reg.behavior {},
} in


# Layer taps
let lts = {
    NUM = MO 1 & kc.ENT & hold.reg.behavior {},
    NAV = MO 2 & kc.N & hold.reg.behavior {},
    SYM = MO 3 & kc.B & hold.reg.behavior {},
} in


# Custom keys
let cu = {
    BOOT = tap.custom.fak.BOOT,
    RST = tap.custom.fak.REST,
    # Lock screen shortcut
    LOCK = tap.reg.mod.lalt & tap.reg.mod.lctl & kc.L

} in



# Layer definitions

let base_layer = [
            kc.Q,     kc.W,     kc.E,     kc.R,     kc.T,        kc.Y,    kc.U,     kc.I,     kc.O,     kc.P,
            hrm.LGUI, hrm.LALT, hrm.LSFT, hrm.LCTL, kc.G,        kc.H,    hrm.RCTL, hrm.RSFT, hrm.RALT, hrm.RGUI,
            kc.Z,     kc.X,     kc.C,     kc.V,     lts.SYM,     lts.NAV, kc.M,     kc.COMM,  kc.SPC,   lts.NUM,

            # Combos
            tap.reg.mod.lctl & dk.PLUS,
            tap.reg.mod.lctl & dk.MINS,
            cu.BOOT,
	        kc.BSPC,
	        kc.TAB,
            ms.BTN1,
            ms.BTN2,
            ms.BTN3,
            ms.BTN4,
            ms.BTN5,
            mc.DRAG_SCROLL,
            cu.LOCK,

        ] in

let num_layer = [
            TTTT,  kc.N7,  kc.N8,  kc.N9,  TTTT,    TTTT,   kc.N7,   kc.N8,   kc.N9,   TTTT,
            kc.N0, kc.N4,  kc.N5,  kc.N6,  kc.COMM, kc.DOT, kc.N4,   kc.N5,   kc.N6,   kc.N0,
            TTTT,  kc.N1,  kc.N2,  kc.N3,  TTTT,    TTTT,   kc.N1,   kc.N2,   kc.N3,   TTTT,

            # Combos
            TTTT,
            TTTT,
            cu.RST,
	        kc.DEL,
	        kc.ESC,
            kc.COMM,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            mc.DRAG_SCROLL_TG,
            TTTT,

        ] in

let nav_layer  = [
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    kc.HOME,  kc.PGDN,  kc.PGUP,  kc.END,    TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    kc.LEFT,  kc.DOWN,  kc.UP,    kc.RIGHT,  TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,     TTTT,     TTTT,     TTTT,      TTTT,

            # Combos
            TTTT,
            TTTT,
            TTTT,
	        TTTT,
	        TTTT,
            mc.DOUBLE_CLICK,
            kc.TAB,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,

        ] in

let sym_layer  = [
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  TTTT,  TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  ks.HASH, TTTT,  TTTT,  TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  TTTT,  TTTT,

            # Combos
            TTTT,
            TTTT,
            TTTT,
	        TTTT,
	        TTTT,
            tap.custom.fak.CWTG,
            kc.CAPS,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,

        ] in


# Keyboard definition

{
    virtual_keys = [                # QWERTY combo positions
        encoder.cw 0,
        encoder.ccw 0,
        combo.make 50 [0, 9],       # Q + P
	    combo.make 50 [12, 13],     # D + F
	    combo.make 50 [16, 17],     # J + K
        combo.make 50 [6, 7],       # U + I
        combo.make 20 [7, 8],       # I + O
        combo.make 50 [6, 7, 8],    # U + I + O (Overlapping combos not implemented)
        combo.make 20 [6, 8],       # U + O
        combo.make 20 [6, 9],       # U + P
        combo.make 50 [8, 9],       # O + P
        combo.make 50 [0, 10, 20],  # Q + A + Z

    ],
    layers = [
        base_layer,
        num_layer,
        nav_layer,
        sym_layer,
    ]
}
