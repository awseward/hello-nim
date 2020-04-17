# This is a compiler error
#
# func f() =
#   echo "test"

# This is not supposed to be, according to the tutorial, but it may just be out
# of date.
#
# Error: invalid pragma: noSideEffect
func f() =
  {.noSideEffect.}
  echo "test"
