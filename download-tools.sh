SWIFT_LINT=./bin/swiftlint
if [ ! -f "$SWIFT_LINT" ]; then
    curl -LJ https://github.com/realm/SwiftLint/releases/download/0.40.3/portable_swiftlint.zip \
     -o /tmp/portable_swiftlint.zip

    unzip -o /tmp/portable_swiftlint.zip swiftlint -d ./bin/

    chmod +x ./bin/swiftlint
fi

SWIFT_FORMAT=./bin/swiftformat
if [ ! -f "$SWIFT_FORMAT" ]; then
    curl -LJ https://github.com/nicklockwood/SwiftFormat/archive/0.46.1.zip \
     -o /tmp/SwiftFormat-0.46.1.zip

    unzip -o -j /tmp/SwiftFormat-0.46.1.zip SwiftFormat-0.46.1/CommandLineTool/swiftformat -d ./bin/

    chmod +x ./bin/swiftformat
fi

XOCDE_GEN=./bin/xcodegen/bin/xcodegen
if [ ! -f "$XOCDE_GEN" ]; then
    curl -LJ https://github.com/yonaskolb/XcodeGen/releases/download/2.17.0/xcodegen.zip \
     -o /tmp/xcodegen.zip

    unzip -o /tmp/xcodegen.zip -d ./bin/
fi
