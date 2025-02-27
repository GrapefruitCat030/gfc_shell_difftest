#!/bin/bash
# Bash quoting examples

# ---- 1. Escape Character (Backslash) examples ----
echo "== Escape Character examples =="
echo "Direct asterisk output: *"      # Will be expanded by shell to all files
echo "Escaped asterisk: \*"           # Shows literal asterisk
echo "Escaped dollar sign: \$HOME"    # No variable substitution, shows $HOME
echo "Escaping spaces: file\ with\ spaces.txt"
echo "Backslash newline for line continuation: "\
"this is still one line"

# ---- 2. Single-Quotes examples ----
echo -e "\n== Single-Quotes examples =="
echo 'All characters preserve literal meaning: $HOME * ? | & ;'
# How to include single-quotes in text
var='Text with embedded single quote: '\''embedded quote'\'''
echo "$var"

# ---- 3. Double-Quotes examples ----
echo -e "\n== Double-Quotes examples =="
HOME="/users/test"
echo "Variables are expanded in double-quotes: $HOME"
echo "Commands are executed in double-quotes: $(date)"
echo "Backtick commands are also executed: `hostname`"
echo "Escapes can be used for: \"quotes within quotes\" and \\backslash"
echo "Backslashes not for escaping: \a \r \t are preserved as is"

# History expansion handling in double quotes
echo "In bash, exclamation mark in double quotes: \"Hello world!\""
set -H  # Enable history expansion
echo "With history enabled, you need to escape it: \"Hello world\!\""

# Special parameters * and @ in double quotes
set -- "arg1" "arg2 with space" "arg3"
echo -e "\nSpecial parameter @ preserves argument boundaries:"
for arg in "$@"; do
  echo "Argument: $arg"
done

echo -e "\nSpecial parameter * joins arguments with first character of IFS:"
echo "Arguments as one string: \"$*\""

# ---- 4. ANSI-C Quoting (Bash-specific) ----
echo -e "\n== ANSI-C Quoting examples =="
echo $'Line 1\nLine 2'  # Newline
echo $'Tab separated\tvalues'  # Tab
echo $'Bell sound: \a'  # Bell
echo $'Special chars: \x41 (hex) \101 (octal) \u03B1 (Unicode alpha)'

# ---- 5. Locale-Specific Translation (Bash-specific) ----
echo -e "\n== Locale-Specific Translation example =="
# This would be translated if proper locale settings and translation files exist
echo $"Hello, world"

# ---- 6. Comments example ----
echo -e "\n== Comments example =="
echo "This is not a comment" # This is a comment
# This entire line is a comment
echo "Command after comment"

# Using comment in interactive mode demo
if [[ $- == *i* ]]; then
  echo "In interactive shells, comments work by default"
  # shopt -s interactive_comments  # already on by default
fi