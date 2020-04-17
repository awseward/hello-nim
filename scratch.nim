import dom, sugar

const bannerText = """

 _          _ _       _
| |__   ___| | | ___ | |
| '_ \ / _ \ | |/ _ \| |
| | | |  __/ | | (_) |_|
|_| |_|\___|_|_|\___/(_)

"""

type Colors = tuple[bg: string, fg: string]

proc flipFlop(c: Colors, fn: proc(_: Colors)): proc() =
  var i = 0
  proc switch(): void =
    if i == 0:
      i = 1
      fn c
    else:
      i = 0
      let c = (c[1], c[0])
      fn c
  return switch


proc main(_: Event) {.exportc.} =
  let body = document.getElementsByTagName("body")[0]
  proc setColors(c: Colors): void =
    body.style.setProperty "background-color", c.bg
    body.style.setProperty "color",            c.fg
  let flip = (bg: "#0074D9", fg: "#FFDC00").flipFlop(setcolors)
  flip()
  discard window.setInterval(flip, 500)

document.addEventlistener("DOMContentLoaded", main)

{.hint: bannerText.}
