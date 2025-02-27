### Implementing until Loop Equivalent in Fish

Fish shell does not have a native `until` loop construct. However, the same functionality can be achieved using the `while` loop with a negated condition.

In POSIX/Bash/Zsh:

```
until [ condition ]
do
  commands
done
```

Equivalent in Fish:

```
while not condition
  commands
end
```

