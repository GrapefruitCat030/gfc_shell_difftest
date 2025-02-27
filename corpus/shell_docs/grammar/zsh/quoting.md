### Zsh Quoting

A character may be *quoted* (made to stand for itself) by preceding it with a `\`. A `\` followed by a newline is ignored.

#### 1. ANSI-C Style Quoting

A string enclosed between `$'` and `'` is processed the same way as the string arguments of the `print` builtin. The resulting string is considered entirely quoted. A literal `'` character can be included using the `\'` escape.

#### 2. Single Quotes

All characters enclosed between single quotes (`''`) that are not preceded by a `$` are quoted. A single quote cannot appear within single quotes unless the option `RC_QUOTES` is set, in which case a pair of single quotes are turned into a single quote.

For example, `print ''''` outputs nothing apart from a newline if `RC_QUOTES` is not set, but one single quote if it is set.

#### 3. Double Quotes

Inside double quotes (`""`), parameter and command substitution occur, and `\` quotes the characters `\`, `'`, `"`, `$`, and the first character of `$histchars` (default `!`).