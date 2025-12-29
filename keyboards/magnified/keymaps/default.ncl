let {tap, hold, combo, ..} = import "fak/keycode.ncl" in


# Common aliases
let kc = tap.reg.kc in
let ks = tap.reg.ks in
let md = hold.reg.mod in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in
let MO = hold.reg.layer in


# Home row mods
let hrm = {
    LGUI = md.lgui & kc.A & hold.reg.behavior {},
    LALT = md.lalt & kc.S & hold.reg.behavior {},
    LSFT = md.lsft & kc.D & hold.reg.behavior {},
    LCTL = md.lctl & kc.F & hold.reg.behavior {},
    
    RCTL = md.rctl & kc.J & hold.reg.behavior {},
    RSFT = md.rsft & kc.K & hold.reg.behavior {},
    RALT = md.ralt & kc.L & hold.reg.behavior {},
    RGUI = md.rgui & kc.QUOT & hold.reg.behavior {},
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
} in



# Layer definitions

let base_layer = [
            kc.Q,     kc.W,     kc.E,     kc.R,     kc.T,       lts.NUM, kc.BSPC,    kc.Y,    kc.U,     kc.I,     kc.O,     kc.P,
            hrm.LGUI, hrm.LALT, hrm.LSFT, hrm.LCTL, kc.G,                kc.TAB,     kc.H,    hrm.RCTL, hrm.RSFT, hrm.RALT, hrm.RGUI,
            kc.Z,     kc.X,     kc.C,     kc.V,     lts.SYM,    kc.SPC,  XXXX,       lts.NAV, kc.M,     kc.COMM,  kc.DOT,   kc.SLSH,

            # Combos
            cu.BOOT,
        ] in

let num_layer = [
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  kc.N7,   kc.N8,   kc.N9,   TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,           TTTT,    TTTT,  kc.N4,   kc.N5,   kc.N6,   kc.N0,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  kc.N1,   kc.N2,   kc.N3,   TTTT,

            # Combos
            cu.RST,
        ] in

let nav_layer  = [
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    kc.HOME,  kc.PGDN,  kc.PGUP,  kc.END,    TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,           TTTT,    kc.LEFT,  kc.DOWN,  kc.UP,    kc.RIGHT,  TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,     TTTT,     TTTT,     TTTT,      TTTT,

            # Combos
            TTTT,
        ] in

let sym_layer  = [
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  TTTT,  TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,           TTTT,    TTTT,  ks.HASH, TTTT,  TTTT,  TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  TTTT,  TTTT,

            # Combos
            TTTT,
        ] in


# Keyboard definition

{
    virtual_keys = [            # QWERTY combo positions
        combo.make 50 [0, 11],  # Q + P
    ],
    layers = [
        base_layer,
        num_layer,
        nav_layer,
        sym_layer,
    ]
}
