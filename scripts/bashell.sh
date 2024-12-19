#!/bin/bash

VAR="Hello, World!"

if [[ "$VAR" == "Hello, World!" ]]; then
    echo "Condition met: $VAR"
else
    echo "Condition not met"
fi