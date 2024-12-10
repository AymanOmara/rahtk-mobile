#!/bin/bash

# Fail the script on the first error
set -e

# Default root directory (can be overridden by an argument)
ROOT_DIR="${1:-$(pwd)}"

# Default coverage directory (can be overridden by an environment variable)
COVERAGE_DIR="${COVERAGE_DIR:-coverage}"

# Clean previous coverage
if [ -d "$COVERAGE_DIR" ]; then
    echo "Cleaning previous coverage data..."
    rm -rf "$COVERAGE_DIR"
fi

# Create coverage directory if it doesn't exist
if [ ! -d "$COVERAGE_DIR" ]; then
    mkdir "$COVERAGE_DIR"
fi

# Function to run tests and collect coverage
run_tests_and_collect_coverage() {
    local dir=$1

    # Skip directories inside .pub-cache
    if [[ "$dir" == *".pub-cache"* ]]; then
        echo "Skipping package in cache directory: $dir"
        return
    fi

    echo "Running tests in $dir..."
    cd "$dir" || exit
    flutter test --coverage || echo "No tests found in $dir, skipping."
    cd "$ROOT_DIR" || exit

    # Check if the coverage directory and file exist
    if [ -d "$dir/coverage" ] && [ -f "$dir/coverage/lcov.info" ]; then
        echo "Merging coverage data from $dir..."
        lcov --add-tracefile "$dir/coverage/lcov.info" --output-file "$COVERAGE_DIR/lcov.info" || echo "Failed to merge coverage from $dir."
    else
        echo "No coverage data found in $dir, skipping."
    fi
}

# Iterate over all packages (directories containing pubspec.yaml)
for dir in $(find "$ROOT_DIR" -name pubspec.yaml -exec dirname {} \;); do
    run_tests_and_collect_coverage "$dir"
done

# Optional: Generate an HTML report if desired (can be enabled with an argument or environment variable)
if [ -z "$DISABLE_HTML_REPORT" ]; then
    echo "Generating HTML report..."
    if [ -f "$COVERAGE_DIR/lcov.info" ] && [ -s "$COVERAGE_DIR/lcov.info" ]; then
        genhtml "$COVERAGE_DIR/lcov.info" -o "$COVERAGE_DIR/html" --ignore-errors source --synthesize-missing
        echo "HTML coverage report generated in $COVERAGE_DIR/html"
        open  "$COVERAGE_DIR/html/index.html"
    else
        echo "No coverage data available to generate HTML report."
    fi
fi

echo "Coverage collection and report generation completed."
