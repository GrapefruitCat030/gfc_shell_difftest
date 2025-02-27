## Builtin commands

Fish includes a number of commands in the shell directly. We call these “builtins”. These include:

- Builtins that manipulate the shell state - [cd] changes directory, [set] sets variables
- Builtins for dealing with data, like [string] for strings and [math] for numbers, [count] for counting lines or arguments, [path] for dealing with path
- [status]for asking about the shell’s status
- [printf] and [echo] for creating output
- [test] for checking conditions
- [argparse] for parsing function arguments
- [source] to read a script in the current shell (so changes to variables stay) and [eval] to execute a string as script
- [random] to get random numbers or pick a random element from a list
- [read] for reading from a pipe or the terminal

A list of all builtins:
.(dot) :(colon) [ _ and argparse begin bg bind block break breakpoint builtin case cd command commandline complete contains continue count disown echo else emit end eval exec exit false fg for function functions history if jobs math not or printf pwd random read realpath return set set_color source status string switch test time true type ulimit wait while