#!/bin/sh
# POSIX for loop examples

# ---- Basic for loop with explicit items ----
echo "== Basic for loop with explicit items =="
for fruit in apple banana orange
do
    echo "Current fruit: $fruit"
done

# ---- For loop with variable expansion ----
echo -e "\n== For loop with variable expansion =="
PLANETS="Mercury Venus Earth Mars"
for planet in $PLANETS
do
    echo "Current planet: $planet"
done

# ---- For loop with command substitution ----
echo -e "\n== For loop with command substitution =="
for file in $(ls *.sh 2>/dev/null)
do
    echo "Shell script file: $file"
done

# ---- For loop with omitted 'in' clause (uses $@) ----
echo -e "\n== For loop with omitted 'in' clause =="
demo_args() {
    for arg
    do
        echo "Argument: $arg"
    done
}
demo_args one two "three four"

# ---- For loop with wildcards (globbing) ----
echo -e "\n== For loop with wildcards =="
# Create some test files
touch test1.txt test2.txt test3.txt
for textfile in *.txt
do
    echo "Text file: $textfile"
done
# Clean up
rm -f test*.txt

# ---- For loop with no iterations ----
echo -e "\n== For loop with no iterations =="
for item in $(echo "")
do
    echo "This will not execute"
done
echo "Exit status: $?" # Should be 0 as per POSIX spec

# ---- For loop with numeric sequences ----
echo -e "\n== For loop with numeric sequences =="
# POSIX doesn't have built-in sequence generation, so we use a workaround
i=1
while [ $i -le 5 ]; do
    echo -n "$i "
    i=$((i + 1))
done
echo ""

# ---- For loop with one-line syntax ----
echo -e "\n== For loop with one-line syntax =="
for color in red green blue; do echo "Color: $color"; done

# ---- Nested for loops ----
echo -e "\n== Nested for loops =="
for i in 1 2 3
do
    for j in a b c
    do
        echo -n "$i$j "
    done
    echo ""
done

# ---- For loop exit status propagation ----
echo -e "\n== For loop exit status =="
for cmd in "true" "false" "true"
do
    eval $cmd
done
echo "Exit status of last iteration: $?"