let { tap, ..} = import "fak/keycode.ncl" in

{
  SLSH = tap.reg.ks.AMPR,                     # /
  MINS = tap.reg.kc.SLSH,                     # -
  QUES = tap.reg.ks.UNDS,                     # ?
  EXLM = tap.reg.ks.EXLM,                     # !
  PLUS = tap.reg.kc.MINS,                     # +
  ACUT = tap.reg.kc.EQL,                      # ´
  GRV  = tap.reg.ks.PLUS,                     # `
  SCLN = tap.reg.ks.LABK,                     # ;
  LBRC = tap.reg.mod.ralt & tap.reg.kc.N8,    # [
  RBRC = tap.reg.mod.ralt & tap.reg.kc.N9,    # ]
  BSLS = tap.reg.mod.ralt & tap.reg.kc.NUBS,  # \
  EQL  = tap.reg.ks.RPRN,                     # =
  QUOT = tap.reg.kc.NUHS,                     # '
  OE   = tap.reg.kc.QUOT,                     # Ø
  AE   = tap.reg.kc.SCLN,                     # Æ
  AA   = tap.reg.kc.LBRC,                     # Å
  AT   = tap.reg.mod.ralt & tap.reg.kc.N2,    # @
  PERC = tap.reg.ks.PERC,                     # %
  HASH = tap.reg.ks.HASH,                     # #
  CURR = tap.reg.ks.DLR,                      # ¤
  AMPR = tap.reg.ks.CIRC,                     # &
  ASTR = tap.reg.mod.lsft & tap.reg.kc.NUHS,  # *
  DIAE = tap.reg.kc.RBRC,                     # ¨
  CIRC = tap.reg.ks.RCBR,                     # ^
  TILD = tap.reg.mod.ralt & tap.reg.kc.RBRC,  # ~
  DQUO = tap.reg.ks.AT,                       # "
  COLN = tap.reg.ks.RABK,                     # :
  UNDS = tap.reg.ks.QUES,                     # _
  HALF = tap.reg.kc.GRV,                      # ½
  SECT = tap.reg.ks.TILD,                     # §
  PIPE = tap.reg.mod.ralt & tap.reg.kc.EQL,   # |
  LCBR = tap.reg.mod.ralt & tap.reg.kc.N7,    # {
  LPRN = tap.reg.ks.ASTR,                     # (
  LABK = tap.reg.kc.NUBS,                     # <
  RABK = tap.reg.mod.lsft & tap.reg.kc.NUBS,  # >
  RPRN = tap.reg.ks.LPRN,                     # )
  RCBR = tap.reg.mod.ralt & tap.reg.kc.N0,    # }
  EUR  = tap.reg.mod.ralt & tap.reg.kc.E,     # €
  PND  = tap.reg.mod.ralt & tap.reg.kc.N3,    # £
  DLR  = tap.reg.mod.ralt & tap.reg.kc.N4,    # $
  MICR = tap.reg.mod.ralt & tap.reg.kc.M,     # µ
}
