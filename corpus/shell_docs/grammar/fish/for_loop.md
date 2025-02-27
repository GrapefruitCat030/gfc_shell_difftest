### For Loop in Fish

Fish has familiar loop constructs including `for` loops that work more like Python's for-loops than C's.

Format:

```
for variable in item_list
  commands
end
```

The part after the `in` is a list of arguments, so you can use any expansions there. If you need a list of numbers, you can use the `seq` command to create one.

`break` is available to break out of a loop, and `continue` to jump to the next iteration.

Input and output redirections (including pipes) can also be applied to loops.

Additionally, fish has a `begin` block that groups commands together so you can redirect to a block or use a new variable scope without repetition.