### The for Loop

The **for** loop executes a sequence of commands for each member in a list of items. The reserved words **do** and **done** are used to delimit the command sequence.

Format:

```
for name [ in [word ... ]]
do
    compound-list
done
```

First, the list of words following **in** is expanded to generate a list of items. Then, the variable *name* is set to each item in turn, and the *compound-list* executed each time. If no items result from the expansion, the *compound-list* is not executed.

Omitting `in word...` is equivalent to `in "$@"` (using all positional parameters).

### Exit Status

The exit status of a **for** command is the exit status of the last command that executes. If there are no items, the exit status is zero.

