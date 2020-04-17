# simple tasking:
type
  Task = iterator (ticker: int)

iterator a1(ticker: int) {.closure.} =
  echo "a1: A"
  yield
  echo "a1: B"
  yield
  echo "a1: C"
  yield
  echo "a1: D"

iterator a2(ticket: int) {.closure.} =
  echo "a2: A"
  yield
  echo "a2: B"
  yield
  echo "a2: C"

proc runTasks(t: varargs[Task]) =
  var ticker = 0
  while true:
    let x = t[ticker mod t.len]
    # `system.finished` is builtin to determine if iterator has finished
    if finished(x): break
    x ticker
    inc ticker

runTasks(a1, a2)

# Note that system.finished is error prone to use because it only returns true
# one iteration after the iterator has finished

iterator mycount(a, b: int): int {.closure.} =
  var x = a
  while x <= b:
    yield x
    inc x

var c = mycount # instantiate the iterator
while not finished(c):
  echo c(1, 3)

# Instead this code has to be used:

var c2= mycount
while true:
  let value = c2(1, 3)
  if finished(c2): break
  echo value

# It helps to think that the iterator actually returns a pair (value, done) and
# finished is used to access the hidden done field.

# Closure iterators are resumable functions and so one has to provide the
# arguments to every call. To get around this limitation one can capture
# parameters of an outer factory proc:

proc mycount2(a, b: int): iterator (): int =
  result = iterator (): int =
    var x = a
    while x <= b:
      yield x
      inc x

let foo = mycount2(1, 4)

for f in foo():
  echo "mycount2: ", f
