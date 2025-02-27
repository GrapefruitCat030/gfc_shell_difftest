### While Loop in Fish

`while` in fish works like a repeated `if` statement. It executes a block of commands as long as the condition evaluates to true (returns a status of 0).

Format:

```
while condition
  commands
end
```

`break` is available to break out of a loop, and `continue` to jump to the next iteration.

Input and output redirections (including pipes) can also be applied to loops.

Additionally, fish has a `begin` block that groups commands together so you can redirect to a block or use a new variable scope without repetition.

