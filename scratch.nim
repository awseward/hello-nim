import re

proc precompiledRegex(pattern: static string): RegEx =
  var res {.global.} = re(pattern)
  return res


const b = ["a", "b", "c"]

var
  a = ["foo", "bar", "baz"]
  re1 = precompiledRegex("/d+")
  re2 = precompiledRegex(b[0])
  re3 = precompiledRegex(a[0])



