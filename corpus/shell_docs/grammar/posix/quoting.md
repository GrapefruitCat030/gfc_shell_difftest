### POSIX Quoting

Quoting is used to remove the special meaning of certain characters or words to the shell, preserve their literal meaning, prevent reserved words from being recognized as keywords, and prevent parameter expansion and command substitution in specific cases.

**Characters that must be quoted to represent themselves:**

| & ; < > ( ) $ ` \ " ' <space> <tab> <newline>

**Characters that may need quoting in certain circumstances:**

\*  ?  [  #  ˜  =  %

**There are three quoting mechanisms:**

#### 1. Escape Character (Backslash)

An unquoted backslash (`\`) preserves the literal value of the following character, except for a newline. If a newline follows the backslash, the shell interprets this as line continuation, removing both before token splitting.

#### 2. Single-Quotes

Characters enclosed in single-quotes (`''`) preserve the literal value of each character within. A single-quote cannot occur within single-quotes.

#### 3. Double-Quotes

Characters in double-quotes (`""`) preserve their literal value, except for backquote (`), dollar-sign ($), and backslash ():

- `$` retains special meaning for parameter expansion, command substitution, and arithmetic expansion
  - Content within `$(...)` is not affected by double-quotes and is replaced by command output
  - Content within `${...}` undergoes parameter expansion
- \``` retains special meaning for command substitution, with ``command`` being replaced by command output
- `\` retains escape functionality only when followed by `$ `" \ <newline>`

**Special note:** To include a double-quote within double-quotes, it must be escaped with a backslash. The parameter `'@'` has special meaning inside double-quotes.