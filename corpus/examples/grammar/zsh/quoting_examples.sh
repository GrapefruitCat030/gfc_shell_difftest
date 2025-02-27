#!/usr/bin/env zsh
# Zsh quoting examples

# ---- 1. Backslash quoting examples ----
echo "== Backslash quoting =="
echo "Special characters quoted with backslash:"
echo "Dollar sign: \$HOME"        # Shows literal $HOME
echo "Asterisk: \*"               # Shows literal asterisk
echo "Backslash itself: \\"       # Shows one backslash
echo "Line continuation: "\
"this is still one line"          # \ followed by newline is ignored

# ---- 2. ANSI-C style quoting examples ----
echo "\n== ANSI-C style quoting =="
echo $'Special escape sequences:'
echo $'Tab (\t) and newline (\n) characters'
echo $'Bell sound: \a'
echo $'Octal character: \101'     # 'A' in ASCII
echo $'Hex character: \x41'       # Also 'A'
echo $'Unicode character: \u03B1' # Greek alpha
echo $'Single quote inside: \''
echo $'Multiple escapes: Line 1\nLine 2\tTabbed'

# ---- 3. Single quotes examples ----
echo "\n== Single quotes =="
echo 'No substitutions happen: $HOME $(echo test) \n \t'

# Single quote in single quotes demonstration 
# First with RC_QUOTES unset
unsetopt RC_QUOTES
echo "With RC_QUOTES unset:"
# This won't work directly, need alternate method
echo 'Cannot include single quote directly inside single quotes'
echo 'Need to use: '\''workaround'\''' # Standard workaround

# Then with RC_QUOTES set
setopt RC_QUOTES
echo "With RC_QUOTES set:"
echo 'Now you can use '' to represent a single quote'
echo 'Example: Don''t worry about escaping'

# ---- 4. Double quotes examples ----
echo "\n== Double quotes =="

# Variable substitution in double quotes
HOME="/users/test"
echo "Variable expansion: $HOME"

# Command substitution in double quotes
echo "Command substitution: $(uname -s)"
echo "Alternative command substitution: `date`"

# History expansion (needs to be escaped)
echo "History reference would happen here: !ls"
echo "Escaped history reference: \!ls"

# Escaping special characters in double quotes
echo "Escaped double quote: \""
echo "Escaped dollar: \$HOME"
echo "Escaped backtick: \`command\`"
echo "Escaped backslash: \\"

# ---- 5. Practical examples combining different quoting styles ----
echo "\n== Practical examples =="

# Complex path with spaces
echo "Working with paths: \"$HOME/My Documents/file name.txt\""

# Grep with complex pattern
echo "Grep example: grep 'don'\''t match this' file.txt"

# Command with arguments needing different quoting
echo "Complex command:"
echo "find . -name '*.txt' -exec grep \"search term\" {} \;"

# Script example showing variable with quotes
message="Don't forget to escape!"
echo "Message: \"$message\""

# Demonstrating $' with complex escaping
echo "ANSI-C example with colors:"
echo $'\e[31mThis is red\e[0m'