template declareInt(x: untyped) =
  var x: int

template declareInt2(x: typed) =
  var x: int

declareInt(a)
a = 3

# declareInt2(b) # invalid, because x has not been declared and so has no type

template withFile(f, fn, mode, actions: untyped): untyped =
  var f: File
  if open(f, fn, mode):
    try:
      actions
    finally:
      close(f)
  else:
    quit("cannot open: " & fn)

withFile(txt, "ttempl3.txt", fmWrite):
  txt.writeLine("line 1")
  txt.writeLine("line 2")

# Usually to pass a block of code to a template the parameter that accepts the
# block needs to be of type untyped. Because symbol lookups are then delayed
# until template instantiation time:
template t(body: typed) =
  block:
    echo "t!!"
    body

t:
  var i = 1
  echo i

t:
  var i = 2 # compile error (Error: redefinition of 'i'; previous declaration here: ...)
  echo i
