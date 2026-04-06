#!/bin/bash

# Check if a Target PID is provided
if [ -z "$1" ]; then
    echo "Usage: ./wait_and_run.sh <PID>"
    echo "Example: ./wait_and_run.sh 12345"
    exit 1
fi

TARGET_PID=$1

echo "==== Monitoring Started ===="
echo "Waiting for PID $TARGET_PID to complete..."

# Block and wait while the target PID exists
while ps -p $TARGET_PID > /dev/null 2>&1; do
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] PID $TARGET_PID is still running... Retrying in 60 seconds."
    sleep 60
done

echo "==== Target Process Terminated ===="
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Initializing training routine..."

# Execute subsequent training command
# your command here, e.g., python train_v8.py --models deberta ctbert --folds 5 --epochs 35

echo "==== Training Routine Completed ===="
