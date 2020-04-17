import dom, sugar

const bannerText = """

 _          _ _       _
| |__   ___| | | ___ | |
| '_ \ / _ \ | |/ _ \| |
| | | |  __/ | | (_) |_|
|_| |_|\___|_|_|\___/(_)

"""

type Colors = tuple[bg: string, fg: string]

proc main() {.exportc.} =
  # discard window.setInterval(() => echo "uhhhh", 500)
  # discard setTimeout(() => echo "why", 1500)
  let body = document.getElementsByTagName("body")[0]

  var i = 0
  proc flipFlop(c: Colors): Colors =
    if i == 0:
      i = 1
      result = c
    else:
      i = 0
      result = (c[1], c[0])

  proc setColors(c: Colors): void =
    let c = flipFlop c
    body.style.setProperty "background-color", c.bg
    body.style.setProperty "color",            c.fg

  let c : Colors = (bg: "green", fg: "white")
  discard window.setInterval(() => setColors(c), 80)

document.addEventlistener("DOMContentLoaded", (ev: Event) => main())

{.hint: bannerText.}
