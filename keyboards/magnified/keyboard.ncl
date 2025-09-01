let { ColToRowKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  matrix = {
    cols = [31, 11, 10, 17, 33, 35],
    rows = [34, 30, 16, 32, 14, 15],
  },
  usb_dev = {
    vendor_id = 462, # mhzkb
    product_id = 0, # magnified
    product_ver = 256, # 0x0100
  },
  keys =
    let M = ColToRowKey in
    [
      M 0 0, M 1 0, M 2 0, M 3 0, M 4 0,  M 5 0, M 5 3, M 4 3, M 3 3, M 2 3, M 1 3, M 0 3,
      M 0 1, M 1 1, M 2 1, M 3 1, M 4 1,         M 5 4, M 4 4, M 3 4, M 2 4, M 1 4, M 0 4,
      M 0 2, M 1 2, M 2 2, M 3 2, M 4 2,  M 5 1, M 5 2, M 4 5, M 3 5, M 2 5, M 1 5, M 0 5,
    ]
}

#  0  1  2  3  4    5  6    7  8  9 10 11
# 12 13 14 15 16      17   18 19 20 21 22
# 23 24 25 26 27   28 29   30 31 32 33 34
