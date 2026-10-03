#!/usr/bin/env bash
# Restores the 2 binaries excluded from git (>100MB GitHub cap)
# from the base image: RestlessOS-arm64-ab-16.0.0-202606230923.img
# Usage (from repo root): ./fetch-binaries.sh /path/to/RestlessOS-arm64-ab-16.0.0-202606230923.img
set -e
SRC="${1:?usage: fetch-binaries.sh <base RestlessOS img>}"
command -v 7z >/dev/null || { echo "need 7z"; exit 1; }
TMP="$(mktemp -d)"
7z x -y -o"$TMP" "$SRC" \
  system/product/app/TrichromeLibrary/TrichromeLibrary.apk \
  system/system_ext/apex/com.android.vndk.v30.apex > /dev/null
mv "$TMP/system/product/app/TrichromeLibrary/TrichromeLibrary.apk" \
   system/product/app/TrichromeLibrary/
mv "$TMP/system/system_ext/apex/com.android.vndk.v30.apex" \
   system/system_ext/apex/
rm -rf "$TMP"
echo "restored:"
ls -l system/product/app/TrichromeLibrary/TrichromeLibrary.apk \
      system/system_ext/apex/com.android.vndk.v30.apex
