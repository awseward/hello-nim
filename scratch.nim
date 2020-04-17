proc p(a: typedesc, b: a) = discard

# compile
p(int, 4)

# no compile
p(int, true)
