#!/usr/bin/env zsh
# Zsh for loop examples

# ---- Basic for loop with explicit items ----
echo "== Basic for loop with explicit items =="
for fruit in apple banana orange
do
    echo "Current fruit: $fruit"
done

# ---- For loop with variable expansion ----
echo -e "\n== For loop with variable expansion =="
planets=(Mercury Venus Earth Mars)
for planet in $planets
do
    echo "Current planet: $planet"
done

# ---- For loop with command substitution ----
echo -e "\n== For loop with command substitution =="
for file in $(ls *.zsh 2>/dev/null)
do
    echo "Zsh script file: $file"
done

# ---- For loop with omitted 'in' clause (uses positional parameters) ----
echo -e "\n== For loop with omitted 'in' clause =="
demo_args() {
    for arg
    do
        echo "Argument: $arg"
    done
}
demo_args one two "three four"

# ---- For loop with brace expansion ----
echo -e "\n== For loop with brace expansion =="
for value in {1..5}
do
    echo "Value: $value"
done

# ---- For loop with multiple parameter names ----
echo -e "\n== For loop with multiple parameter names =="
for key value in name John age 30 city "New York"
do
    echo "$key: $value"
done

# ---- C-style for loop ----
echo -e "\n== C-style for loop =="
for ((i=1; i<=5; i++))
do
    echo "Counter: $i"
done

# ---- C-style for loop with multiple variables ----
echo -e "\n== C-style for loop with multiple variables =="
for ((i=1, j=10; i<=5; i++, j--))
do
    echo "i=$i, j=$j"
done

# ---- For loop with break statement ----
echo -e "\n== For loop with break statement =="
for i in {1..10}
do
    echo "Iteration: $i"
    if [[ $i -eq 5 ]]; then
        echo "Breaking at 5"
        break
    fi
done

# ---- For loop with continue statement ----
echo -e "\n== For loop with continue statement =="
for i in {1..5}
do
    if [[ $i -eq 3 ]]; then
        echo "Skipping 3"
        continue
    fi
    echo "Number: $i"
done

# ---- For loop with one-line syntax ----
echo -e "\n== For loop with one-line syntax =="
for color in red green blue; do echo "Color: $color"; done

# ---- For loop with glob qualifier ----
echo -e "\n== For loop with glob qualifier =="
# Create some test files
touch file1.txt file2.txt file3.log
for file in *.*(.)  # Regular files only
do
    echo "Regular file: $file"
done
# Clean up
rm -f file*.txt file*.log

# ---- For loop with associative array ----
echo -e "\n== For loop with associative array =="
typeset -A person
person=(name "John" age 30 city "New York")
for key val in ${(kv)person}
do
    echo "$key: $val"
done