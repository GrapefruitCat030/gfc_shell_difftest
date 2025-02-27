### Bash Quoting

Quoting is used to remove the special meaning of certain characters or words to the shell. It can disable special treatment for special characters, prevent reserved words from being recognized as such, and prevent parameter expansion.

Shell metacharacters have special meaning and must be quoted to represent themselves. When history expansion is being used, the history expansion character (usually '!') must also be quoted to prevent expansion.

**There are five quoting mechanisms in Bash:**

#### 1. Escape Character (Backslash)

A non-quoted backslash (`\`) preserves the literal value of the next character, except for newline. A `\newline` pair is treated as a line continuation (removed from input and ignored).

#### 2. Single Quotes

Characters enclosed in single quotes (`''`) preserve the literal value of each character. A single quote cannot occur between single quotes, even when preceded by a backslash.

#### 3. Double Quotes

Characters in double quotes (`""`) preserve their literal value, except for `$`, ```, `\`, and `!` (when history expansion is enabled). In POSIX mode, `!` has no special meaning within double quotes.

- `$` and ``` retain their special meaning for expansions
- `\` retains special meaning only when followed by `$`, ```, `"`, `\`, or newline
- Within double quotes, backslashes followed by these special characters are removed
- A double quote may be included by preceding it with a backslash
- The special parameters `*` and `@` have special meaning in double quotes

#### 4. ANSI-C Quoting (Bash-specific)

Sequences like `$'STRING'` are treated as special single quotes. Backslash-escaped characters in STRING are replaced according to ANSI C standard:

```
\a - alert (bell)
\b - backspace
\e, \E - escape character
\f - form feed
\n - newline
\r - carriage return
\t - horizontal tab
\v - vertical tab
\\ - backslash
\' - single quote
\" - double quote
\? - question mark
\NNN - octal value (1-3 digits)
\xHH - hexadecimal value (1-2 digits)
\uHHHH - Unicode character (1-4 hex digits)
\UHHHHHHHH - Unicode character (1-8 hex digits)
\cX - control-X character
```

The expanded result is single-quoted.

#### 5. Locale-Specific Translation (Bash-specific)

Prefixing a double-quoted string with `$`, like `$"hello, world"`, causes the string to be translated according to the current locale using the gettext infrastructure. Translation depends on `LC_MESSAGES`, `TEXTDOMAINDIR`, and `TEXTDOMAIN` shell variables.

### Comments

In a non-interactive shell or an interactive shell with the `interactive_comments` option enabled, a word beginning with `#` causes that word and all remaining characters on that line to be ignored. The `interactive_comments` option is on by default in interactive shells.