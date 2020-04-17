type
  Index = distinct int

proc `$`(i: Index): string {.borrow.}
proc `==` (a, b: Index): bool {.borrow.}
proc `+` (a, b: Index): Index {.borrow.}

proc `+` (a, b: (int, Index)): (int, Index) =
  # FIXME
  return (a[0] + b[0], a[1] + b[1])


var a = (1, 3.Index)
var b = (2, 4.Index)

echo a == b
echo a + b
