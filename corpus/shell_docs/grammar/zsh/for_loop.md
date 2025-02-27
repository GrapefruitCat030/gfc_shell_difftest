### For Loop in Zsh

Zsh supports two forms of the `for` command:

#### Traditional form:

```
for name ... [in word ...] term do list done
```

Expand the list of words, and set the parameter name to each of them in turn, executing list each time. If the 'in word' is omitted, use the positional parameters instead.

More than one parameter name can appear before the list of words. If N names are given, then on each execution of the loop the next N words are assigned to the corresponding parameters.

#### C-style form:

```
for ((expr1; expr2; expr3)) do list done
```

The arithmetic expression expr1 is evaluated first. The arithmetic expression expr2 is repeatedly evaluated until it evaluates to zero and when non-zero, list is executed and expr3 evaluated. If any expression is omitted, it behaves as if it evaluated to 1.