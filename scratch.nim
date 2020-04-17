proc main =
  var f = open("numbers.txt")
  defer: close(f)
  f.write "abc"
  f.write "123"

# is rewritten to:

proc mainRewritten =
  var f = open("numbers.txt")
  try:
    f.write "xyz"
    f.write "987"
  finally: close(f)

# main()
mainRewritten()

