# Nim supports exception tracking. The raises pragma can be used to explicitly
# define which exceptions a proc/iterator/method/converter is allowed to raise.
# The compiler verifies this:

type
  LoadError* = object of Exception

proc p(what: bool) {.raises: [IOError, OSError].} =
  if what: raise newException(IOError, "IO")
  # following line makes compiler error :)
  # elif true: raise newException(LoadError, "wat")
  else: raise newException(OSError, "OS")

# A raises list can also be attached to a proc type. This affects type
# compatibility:

type
  Callback = proc (s: string) {.raises: [IOError].}

var c: Callback

proc pWrong(x: string) = raise newException(OSError, "OS")

proc pRight(x: string) {.raises: [IOError].} =
  echo x
  discard

# Error: type mismatch: got <None> but expected 'Callback = proc (s: string){.closure.}'
# c = p

# Okay!
c = pRight

c "hi"

# -------------

proc noRaise(x: proc()) {.raises: [].} =
  # unknown call that might raise anything, but valid:
  x()

proc doRaise() {.raises: [IOError].} =
  raise newException(IOError, "IO")

proc use() {.raises: [].} =
  # doesn't compile! Can raise IOError!
  # noRaise(doRaise)
  discard
