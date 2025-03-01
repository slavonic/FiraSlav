#!/bin/bash

# Check if the system is a Mac
if [[ "$OSTYPE" == "darwin"* ]]; then
    FONTFORGE_BIN="/Applications/FontForge.app/Contents/Resources/opt/local/bin/fontforge"
    if [[ ! -x "$FONTFORGE_BIN" ]]; then
        echo "FontForge binary not found in FontForge.app package."
        exit 1
    fi
else
    FONTFORGE_BIN="fontforge"
fi

# Run FontForge with the provided arguments
$FONTFORGE_BIN -lang=ff -c 'Open($1); Generate($2)' sources/FiraSlav-Regular.sfd sources/FiraSlav-Regular.ufo
$FONTFORGE_BIN -lang=ff -c 'Open($1); Generate($2)' sources/FiraSlav-Bold.sfd sources/FiraSlav-Bold.ufo

# Dirty hack to add the openTypeOS2Selection key to the fontinfo.plist file
FONTINFO=`cat sources/FiraSlav-Regular.ufo/fontinfo.plist`
echo "${FONTINFO/    <key>openTypeOS2Type<\/key>/    <key>openTypeOS2Selection</key>$'\n'    <array>$'\n'      <integer>7</integer>$'\n'    </array>$'\n'    <key>openTypeOS2Type</key>}" > sources/FiraSlav-Regular.ufo/fontinfo.plist
FONTINFO=`cat sources/FiraSlav-Bold.ufo/fontinfo.plist`
echo "${FONTINFO/    <key>openTypeOS2Type<\/key>/    <key>openTypeOS2Selection</key>$'\n'    <array>$'\n'      <integer>7</integer>$'\n'    </array>$'\n'    <key>openTypeOS2Type</key>}" > sources/FiraSlav-Bold.ufo/fontinfo.plist
