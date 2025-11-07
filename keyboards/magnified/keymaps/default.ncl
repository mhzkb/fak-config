let {tap, hold, ..} = import "fak/keycode.ncl" in

let kc = tap.reg.kc in
let md = hold.reg.mod in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in
let MO = hold.reg.layer in

let cu = {
    AGUI = md.lgui & kc.A & hold.reg.behavior {},
    SALT = md.lalt & kc.S & hold.reg.behavior {},
    DSFT = md.lsft & kc.D & hold.reg.behavior {},
    FCTL = md.lctl & kc.F & hold.reg.behavior {},
    JCTL = md.rctl & kc.J & hold.reg.behavior {},
    KSFT = md.rsft & kc.K & hold.reg.behavior {},
    LALT = md.ralt & kc.L & hold.reg.behavior {},
    # Layer tap
    ENT_SYS = MO 1 & kc.ENT & hold.reg.behavior{},

    BOOT = tap.custom.fak.BOOT,
} in

{
    layers = [
        [
            kc.Q,    kc.W,    kc.E,    kc.R,    kc.T,    kc.ENT,    kc.BSPC,  kc.Y,   kc.U,    kc.I,    kc.O,    kc.P,
            cu.AGUI, cu.SALT, cu.DSFT, cu.FCTL, kc.G,               kc.TAB,   kc.H,   cu.JCTL, cu.KSFT, cu.LALT, kc.ESC,
            kc.Z,    kc.X,    kc.C,    kc.V,    kc.B,    kc.SPC,    kc.SPC,   kc.N,   kc.M,    kc.COMM, kc.DOT,  kc.SLSH,
        ],
        [
            cu.BOOT, TTTT,    TTTT,    TTTT,    TTTT,    TTTT,      TTTT,     TTTT,   kc.N7,   kc.N8,   kc.N9,   TTTT,
            TTTT,    TTTT,    TTTT,    TTTT,    TTTT,               TTTT,     TTTT,   kc.N4,   kc.N5,   kc.N6,   kc.N0,
            TTTT,    TTTT,    TTTT,    TTTT,    TTTT,    TTTT,      TTTT,     TTTT,   kc.N1,   kc.N2,   kc.N3,   TTTT,
        ]
    ]
}