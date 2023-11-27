#!/bin/bash

# Check if the duration is passed as an argument
if [ -z "$1" ]; then
    echo "Please provide the execution duration as an argument."
    exit 1
fi

DURATION=$1

# Execute perf record
perf record -g -p 1 -- sleep $DURATION
#perf record -g --call-graph dwarf -p 1 -- sleep $DURATION

# Execute perf script
perf script > perf.script

# Generate the flamegraph
FLAMEGRAPH_FILE="nano-flame_$(date +'_%Y-%m-%d_%H-%M').svg"
/opt/FlameGraph/stackcollapse-perf.pl perf.script > perf.folded
/opt/FlameGraph/flamegraph.pl perf.folded > /data/$FLAMEGRAPH_FILE

# Output the file path and success message
echo "Flamegraph generated successfully."
echo "File path: $FLAMEGRAPH_FILE"
