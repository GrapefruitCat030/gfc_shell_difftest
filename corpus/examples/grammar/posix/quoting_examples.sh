#!/bin/sh
# POSIX Shell quoting examples

# 1. Escape Character (Backslash) examples
echo "Escaping special characters:"
echo "Direct asterisk output: *"      # Will be expanded by shell to all files
echo "Escaped asterisk: \*"           # Shows literal asterisk
echo "Escaped dollar sign: \$HOME"    # No variable substitution, shows $HOME
echo "Escaping spaces prevents tokenization: file\ with\ spaces.txt"
echo "Backslash newline for line continuation: "\
"this is still one line"

# 2. Single-Quotes examples
echo 'Single-quotes examples:'
echo 'All characters in single-quotes retain literal meaning: $HOME * ? | & ;'
# Demonstrating how to include single-quotes in text
var='Text with embedded single quote: '\''embedded quote'\'''
echo "$var"

# 3. Double-Quotes examples
echo "Double-quotes examples:"
HOME="/users/test"
echo "Variables are expanded in double-quotes: $HOME"
echo "Commands are executed in double-quotes: $(date)"
echo "Backtick commands are also executed: `hostname`"
echo "Escapes can be used in double-quotes: \"quotes within quotes\" and \\backslash"
echo "Backslashes not for escaping: \a \r \t are preserved as is"

# Special parameter @ examples
set -- "arg1" "arg2 with space" "arg3"
echo "Special parameter @ examples:"
echo "Using @ to preserve spaces in arguments:"
for arg in "$@"; do
  echo "Argument: $arg"
done

echo "Using @ without quotes:"
for arg in $@; do
  echo "Argument: $arg"  # Will split on spaces
done

# Command substitution and quoting interaction
echo "Command substitution and quoting interaction:"
echo "Command substitution in double-quotes: $(echo "inner double-quotes")"
echo "Single-quotes don't process command substitution: '$(echo this will not execute)'"
echo "Backtick substitution: `echo this will execute`"