let {tap, hold, combo, macro, LT, ..} = import "fak/keycode.ncl" in
let dk = import "lib/danish.ncl" in

let kc = tap.reg.kc in
let md = hold.reg.mod in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in
let MO = hold.reg.layer in
let ms = tap.custom.mouse in

# Home row mods with optional layer tap
let hrm = {
    LGUI = md.lgui & kc.A & hold.reg.behavior {},
    LALT = LT {} 6 kc.S & md.lalt,
    LSFT = LT {} 5 kc.D & md.lsft,
    LCTL = LT {} 7 kc.F & md.lctl,
    
    RCTL = md.rctl & kc.J & hold.reg.behavior {},
    RSFT = LT {} 4 kc.K & md.rsft,
    RALT = md.ralt & kc.L & hold.reg.behavior {},
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

# Send Drag Scroll macro to trackball
let DRAG_SCROLL_TG = macro.make [
    macro.tap kc.NUM,
    macro.wait 20,
    macro.tap kc.NUM,
    ] in

let DRAG_SCROLL = macro.make [
    macro.tap kc.NUM,
    macro.wait 20,
    macro.tap kc.NUM,
    macro.pause_for_release,
    macro.tap kc.NUM,
    macro.wait 20,
    macro.tap kc.NUM,
    ] in


# Layer definitions

let base_layer = [
            kc.Q,     kc.W,     kc.E,     kc.R,     kc.T,     lts.NUM, kc.BSPC,  kc.Y,    kc.U,     kc.I,     kc.O,     kc.P,
            hrm.LGUI, hrm.LALT, hrm.LSFT, hrm.LCTL, kc.G,              kc.TAB,   kc.H,    hrm.RCTL, hrm.RSFT, hrm.RALT, kc.ESC,
            kc.Z,     kc.X,     kc.C,     kc.V,     lts.SYM,  kc.SPC,  kc.BSPC,  lts.NAV, kc.M,     kc.COMM,  kc.DOT,   dk.MINS,

            # Combos
            cu.BOOT,
            ms.BTN1,
            ms.BTN2,
            ms.BTN3,
            ms.BTN4,
            ms.BTN5,
            DRAG_SCROLL,
            cu.LOCK,

        ] in

let num_layer = [
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  kc.N7,   kc.N8,   kc.N9,   TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,           TTTT,    TTTT,  kc.N4,   kc.N5,   kc.N6,   kc.N0,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,  kc.N1,   kc.N2,   kc.N3,   TTTT,

            # Combos
            cu.RST,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            DRAG_SCROLL_TG,
            TTTT,
        ] in

let nav_layer  = [
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    kc.HOME, kc.PGDN, kc.PGUP, kc.END,   TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,           TTTT,    kc.LEFT, kc.DOWN, kc.UP,   kc.RIGHT, TTTT,
            TTTT,  TTTT,  TTTT,  TTTT,  TTTT,    TTTT,  TTTT,    TTTT,    TTTT,    TTTT,    TTTT,     TTTT,

            # Combos
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
        ] in

let sym_layer  = [
            TTTT,    dk.EXLM, dk.DQUO, dk.HASH, dk.TILD,  TTTT, TTTT,  dk.SLSH, dk.PLUS, dk.EQL,  dk.QUES, dk.AA,
            dk.PIPE, dk.PERC, dk.AMPR, dk.ASTR, dk.BSLS,        TTTT,  dk.LCBR, dk.LPRN, dk.RPRN, dk.RCBR, dk.OE,
            dk.QUOT, TTTT,    dk.ACUT, dk.GRV,  TTTT,     TTTT, TTTT,  dk.LABK, dk.LBRC, dk.RBRC, dk.RABK, dk.AE,

            # Combos
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
            TTTT,
        ] in


# Key Override implementation adapted from https://github.com/bgkendall/ - requires nickel >= 1.7.0
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

let CopyLayerWithOverrides = fun origin overrides =>
  std.array.map_with_index
    (fun index keycode => std.record.get_or (std.string.from_number index) keycode overrides)
    origin
in


# Generated layers
let transparent_layer = std.array.replicate (std.array.length base_layer) TTTT in

# Modified layers

let l_altered_layer_overrides = {
    "28" = kc.TAB,
} in

let l_controlled_layer_overrides = {
    "28" = kc.TAB,
} in

let l_altered_base_layer = CopyLayerWithOverrides transparent_layer l_altered_layer_overrides in
let l_controlled_base_layer = CopyLayerWithOverrides transparent_layer l_controlled_layer_overrides in

# Abstracted shifted layer with canceled modifiers

let l_shifted_layer_overrides = {
   "6" = LiftMod_Tap md.lsft kc.DEL,
  "28" = LiftMod_Tap md.lsft kc.ENT,
} in

let r_shifted_layer_overrides = {
   "6" = LiftMod_Tap md.rsft kc.DEL,
  "28" = LiftMod_Tap md.rsft kc.BSPC,
} in

let l_shifted_base_layer = CopyLayerWithOverrides transparent_layer l_shifted_layer_overrides in
let r_shifted_base_layer = CopyLayerWithOverrides transparent_layer r_shifted_layer_overrides in


# Keymap definition
{
    virtual_keys = [                # QWERTY combo positions
        combo.make 50 [0, 11],      # Q + P
        combo.make 50 [8, 9],       # U + I
        combo.make 20 [9, 10],      # I + O
        combo.make 50 [8, 9, 10],   # U + I + O (Overlapping combos not implemented)
        combo.make 20 [8, 10],      # U + O
        combo.make 20 [8, 11],      # U + P
        combo.make 50 [10, 11],     # O + P
        combo.make 50 [0, 12, 23],  # Q + A + Z
    ],
    layers = [
        base_layer,
        num_layer,
        nav_layer,
        sym_layer,
        r_shifted_base_layer,
        l_shifted_base_layer,
        l_altered_base_layer,
        l_controlled_base_layer,
    ]
}
