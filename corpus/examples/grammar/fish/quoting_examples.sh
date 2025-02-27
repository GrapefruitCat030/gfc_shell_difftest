#!/usr/bin/env fish
# Fish shell quoting examples

# ---- Basic quoting examples ----
echo "== Basic quoting examples =="

# Spaces in arguments
echo "With quotes:" "my file.txt"
echo "Without quotes:" my file.txt  # Treated as separate arguments

# Preventing wildcard expansion
echo "Quoted wildcard:" "*.txt"     # Prints literal *.txt
echo "Unquoted wildcard:" *.txt     # Expands to all .txt files

# ---- Single quotes examples ----
echo "== Single quotes examples =="

# No expansions in single quotes
set name "Alice"
echo 'Single quotes - No variable expansion: $name'
echo 'Single quotes - No command substitution: $(hostname)'

# Escaping single quotes
echo 'Text with escaped single quote: \' continues'
echo 'Escaped backslash: \\'

# ---- Double quotes examples ----
echo "== Double quotes examples =="

# Variable expansion in double quotes
echo "Double quotes - Variable expansion: $name"

# Command substitution in double quotes
echo "Double quotes - Command substitution: $(hostname)"

# Escaping in double quotes
echo "Escaped double quote: \" inside quotes"
echo "Escaped dollar sign: \$name isn't expanded"
echo "Escaped backslash: \\"

# Newlines in double quotes
echo "Line continuation: \
This is still the same line"

# ---- No interpolation of escape sequences ----
echo "== Escape sequences behavior =="
echo "In fish, \n is not interpolated as a newline in quotes"
echo "Use echo -e for that:"
echo -e "With -e option: \n- creates newline"

# ---- Nesting quotes ----
echo "== Nested quotes examples =="
echo "Single quotes inside double: 'text in single quotes'"
echo 'Double quotes inside single: "text in double quotes"'

# ---- Practical examples ----
echo "== Practical examples =="

# Searching for special characters in grep
echo "Example grep command:"
echo 'grep \'enabled)$\' config.txt'

# Package installation with wildcards
echo "Example package installation:"
echo 'apt install "postgres-*"'

# Complex command with quotes
set complex_dir "My Documents"
echo "Running command in \"$complex_dir\" directory"

# Variable with quoted content
set message "Don't panic!"
echo "Message: $message"