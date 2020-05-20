import httpClient
import json
import os
import strUtils

import ./common

echo "Consumer consuming on ", PbUrl

let client = newHttpClient()
echo client.getContent PbUrl
