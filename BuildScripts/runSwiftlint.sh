CURRENT_CONFIGURATION=${CONFIGURATION}
export PATH="$PATH:/opt/homebrew/bin"

# Exit out of the script if current configuration is not debug
if [[ $CURRENT_CONFIGURATION == *"Release"* ]]; then
echo "Swiftlint is disabled in release configuration"
exit 0
fi

# If swiftlint is installed on developer machine, run swiftlint
if which swiftlint >/dev/null; then
swiftlint
else
echo "error: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
