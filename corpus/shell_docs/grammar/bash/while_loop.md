### While Loop in Bash

Format:

```
while TEST-COMMANDS; do CONSEQUENT-COMMANDS; done
```

Execute CONSEQUENT-COMMANDS as long as TEST-COMMANDS has an exit status of zero. The return status is the exit status of the last command executed in CONSEQUENT-COMMANDS, or zero if none was executed.

The `break` and `continue` builtins may be used to control loop execution.