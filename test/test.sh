#!/bin/bash

CPP_FILE="app/main.cpp"
OUTPUT_BINARY="app/main.out"
EXPECTED_OUTPUT="Hello, World!"

# Compile the C++ file
echo "Compiling $CPP_FILE..."
g++ -o "$OUTPUT_BINARY" "$CPP_FILE"
if [ $? -ne 0 ]; then
    echo "❌ Compilation failed."
    exit 1
fi

# Run the compiled binary and capture output
echo "Running $OUTPUT_BINARY..."
ACTUAL_OUTPUT=$(./"$OUTPUT_BINARY")

# Check the output
if [ "$ACTUAL_OUTPUT" == "$EXPECTED_OUTPUT" ]; then
    echo "✅ Test passed: Output is '$EXPECTED_OUTPUT' test branch"
    exit 0
else
    echo "❌ Test failed: Expected '$EXPECTED_OUTPUT' but got '$ACTUAL_OUTPUT'"
    exit 1
fi
