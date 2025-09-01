let {tap, hold, ..} = import "fak/keycode.ncl" in

let kc = tap.reg.kc in
let md = hold.reg.mod in

let cu = {
    BOOT = tap.custom.fak.BOOT,
} in

{
    layers = [
        [
            kc.Q,   kc.W,   kc.E,   kc.R,   kc.T,   kc.ENT,   kc.BSPC,  kc.Y,   kc.U,   kc.I,   kc.O,   kc.P,
            kc.A,   kc.S,   kc.D,   kc.F,   kc.G,             cu.BOOT,  kc.H,   kc.J,   kc.K,   kc.L,   kc.ESC,
            kc.Z,   kc.X,   kc.C,   kc.V,   kc.B,   kc.SPC,   kc.TAB,   kc.N,   kc.M,   kc.COMM,kc.DOT, kc.SLSH,
        ]
    ]
}