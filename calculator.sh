#!/bin/bash

# Check that there are at least three arguments
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <num1> <op> <num2> [<op> <num> ...]"
    exit 1
fi

# Parse the first argument and shift the remaining arguments
result="$1"
shift

# Perform the calculation
while [ $# -gt 0 ]; do
    op="$1"
    num="$2"
    shift 2
    if [ "$op" == "+" ]; then
        result=$(echo "$result + $num" | bc)
    elif [ "$op" == "-" ]; then
        result=$(echo "$result - $num" | bc)
    elif [ "$op" == "*" ]; then
        result=$(echo "$result * $num" | bc)
    elif [ "$op" == "/" ]; then
        result=$(echo "$result / $num" | bc)
    else
        echo "Invalid operation: $op"
        exit 1
    fi
done

# Displaying the result
echo "Result: $result"
