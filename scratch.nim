import macros

macro debug(n: varargs[typed]): untyped =
  result = newNimNode(nnkStmtList, n)
  for x in n:
    add(result, newCall(bindSym"write", bindSym"stdout", newStrLitNode("[DEBUG] ")))
    add(result, newCall(bindSym"write", bindSym"stdout", toStrlit(x)))
    add(result, newCall(bindSym"write", bindSym"stdout", newStrLitNode(": ")))
    add(result, newCall(bindSym"writeLine", bindSym"stdout", x))

var
  a: array[0..10, int]
  x = "some string"
a[0] = 42
a[1] = 45

debug(a[0], a[1], x)
