import strUtils
import json
import os

const PbChannel = getEnv "PB_CHANNEL"
const PbUrl* = "https://patchbay.pub/" & PbChannel

echo PbChannel

type Shape {.pure.} = enum
  circle,
  square,
  triangle

proc fromJson(jsonNode: JsonNode): Shape =
  parseEnum[Shape] jsonNode["shape"].getStr()
