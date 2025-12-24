#!/bin/bash

# Configuration
APP_NAME="Clean Slate"
BUNDLE_ID="com.dinki.CleanSlate"
SRC_DIR="Sources"
RES_DIR="Resources"
BUILD_DIR="build"
APP_BUNDLE="$BUILD_DIR/$APP_NAME.app"
CONTENTS_DIR="$APP_BUNDLE/Contents"
MACOS_DIR="$CONTENTS_DIR/MacOS"
RESOURCES_DIR="$CONTENTS_DIR/Resources"

# cleanup
rm -rf "$BUILD_DIR"
mkdir -p "$MACOS_DIR"
mkdir -p "$RESOURCES_DIR"

# Generate Icon
if [ -f "$RES_DIR/Appicon.png" ]; then
    echo "Generating AppIcon.icns..."
    ICONSET="$BUILD_DIR/AppIcon.iconset"
    mkdir -p "$ICONSET"
    sips -z 16 16     "$RES_DIR/Appicon.png" --out "$ICONSET/icon_16x16.png" > /dev/null
    sips -z 32 32     "$RES_DIR/Appicon.png" --out "$ICONSET/icon_16x16@2x.png" > /dev/null
    sips -z 32 32     "$RES_DIR/Appicon.png" --out "$ICONSET/icon_32x32.png" > /dev/null
    sips -z 64 64     "$RES_DIR/Appicon.png" --out "$ICONSET/icon_32x32@2x.png" > /dev/null
    sips -z 128 128   "$RES_DIR/Appicon.png" --out "$ICONSET/icon_128x128.png" > /dev/null
    sips -z 256 256   "$RES_DIR/Appicon.png" --out "$ICONSET/icon_128x128@2x.png" > /dev/null
    sips -z 256 256   "$RES_DIR/Appicon.png" --out "$ICONSET/icon_256x256.png" > /dev/null
    sips -z 512 512   "$RES_DIR/Appicon.png" --out "$ICONSET/icon_256x256@2x.png" > /dev/null
    sips -z 512 512   "$RES_DIR/Appicon.png" --out "$ICONSET/icon_512x512.png" > /dev/null
    sips -z 1024 1024 "$RES_DIR/Appicon.png" --out "$ICONSET/icon_512x512@2x.png" > /dev/null
    
    iconutil -c icns "$ICONSET" -o "$RESOURCES_DIR/AppIcon.icns"
fi

# Copy Resources
cp "$RES_DIR/Info.plist" "$CONTENTS_DIR/Info.plist"

# Inject Build Date
BUILD_DATE=$(date "+%Y-%m-%d")
/usr/libexec/PlistBuddy -c "Add :BuildDate string $BUILD_DATE" "$CONTENTS_DIR/Info.plist"


# Compile
echo "Compiling Swift sources..."
swiftc "$SRC_DIR"/*.swift -o "$MACOS_DIR/$APP_NAME" -target arm64-apple-macosx11.0 -framework AppKit

# Check if build succeeded
if [ $? -eq 0 ]; then
    echo "Build successful: $APP_BUNDLE"
    
    # Ad-hoc sign to run locally
    codesign --force --deep --sign - "$APP_BUNDLE"
    echo "Signed $APP_BUNDLE"
else
    echo "Build failed"
    exit 1
fi
