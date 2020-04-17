template typedef(name: untyped, typ: typedesc) =
  type
    `T name`* {.inject.} = typ
    `P name`* {.inject.} = ref `T name`

typedef(myint, int)
var x: PMyInt
