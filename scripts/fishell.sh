#!/usr/bin/env fish

set VAR "Hello, World!"

if test "$VAR" = "Hello, World!"
    echo "Condition met: $VAR"
else
    echo "Condition not met"
end