type IO = object ## input/output effect
proc readLine(): string {.tags: [IO].} = discard

proc no_IO_please() {.tags: [].} =
  # the compiler prevents this:
  #   Error: can have an unlisted effect: IO
  # let x = readLine()
  discard

# The effects pragma has been designed to assist the programmer with the
# effects analysis. It is a statement that makes the compiler output all
# inferred effects up to the effects's position:

proc p(what: bool) =
  if what:
    raise newException(IOError, "IO")
    {.effects.}
  else:
    raise newException(OSError, "OS")
