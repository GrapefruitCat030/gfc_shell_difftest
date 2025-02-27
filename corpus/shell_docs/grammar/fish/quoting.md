### Fish Quoting

Fish understands two kinds of quotes: Single (`'`) and double (`"`), both used when you need to include special characters (like spaces, `$`, or `*`) in arguments.

#### 1. Single Quotes

Between single quotes (`''`), fish performs **no expansions**. The only meaningful escape sequences in single quotes are:

- `\'` - escapes a single quote
- `\\` - escapes the backslash symbol

#### 2. Double Quotes

Between double quotes (`""`), fish only performs:

- Variable expansion
- Command substitution in the `$(command)` form

No other expansions occur within double quotes (including brace expansion or parameter expansion), and escape sequences (like `\n`) are ignored.

The only meaningful escape sequences in double quotes are:

- `\"` - escapes a double quote
- `\$` - escapes a dollar character
- `\` followed by a newline - deletes both the backslash and newline
- `\\` - escapes the backslash symbol

#### 3. Additional Notes

- Within quotes, whitespace is not used to separate arguments, allowing spaces in arguments
- Single quotes have no special meaning within double quotes and vice versa
- Quotes are commonly used to prevent wildcards from expanding to filenames and to include spaces in arguments