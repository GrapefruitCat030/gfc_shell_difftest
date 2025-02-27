### For Loop in Bash

Bash supports two forms of the `for` command:

#### Traditional form:

```
for NAME [in WORDS ...]; do COMMANDS; done
```

Expand WORDS, and execute COMMANDS once for each member in the resultant list, with NAME bound to the current member. If 'in WORDS' is not present, the `for` command executes COMMANDS once for each positional parameter, as if 'in "$@"' had been specified.

#### C-style form:

```
for ((EXPR1; EXPR2; EXPR3)); do COMMANDS; done
```

First, EXPR1 is evaluated. The arithmetic expression EXPR2 is then evaluated repeatedly until it evaluates to zero. Each time EXPR2 evaluates to a non-zero value, COMMANDS are executed and EXPR3 is evaluated. If any expression is omitted, it behaves as if it evaluates to 1.

The return status is the exit status of the last command executed, or false if any of the expressions is invalid. The `break` and `continue` builtins may be used to control loop execution.

