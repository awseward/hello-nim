import httpClient
import json
import os
import strUtils

import ./common

echo "Producer producing on ", PbUrl

let client = newHttpClient()
discard client.postContent(PbUrl, "hi!!!!")
