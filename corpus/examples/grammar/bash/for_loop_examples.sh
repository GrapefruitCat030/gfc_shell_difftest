#!/bin/bash
# Bash for loop examples

# ---- Traditional for loop with explicit items ----
echo "== Traditional for loop with explicit items =="
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

# ---- For loop with brace expansion ----
echo -e "\n== For loop with brace expansion =="
for value in {1..5}
do
    echo "Value: $value"
done

# ---- For loop with sequence and increment ----
echo -e "\n== For loop with sequence and increment =="
for value in {10..20..2}
do
    echo "Even value: $value"
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
    if [ $i -eq 5 ]; then
        echo "Breaking at 5"
        break
    fi
done

# ---- For loop with continue statement ----
echo -e "\n== For loop with continue statement =="
for i in {1..5}
do
    if [ $i -eq 3 ]; then
        echo "Skipping 3"
        continue
    fi
    echo "Number: $i"
done

# ---- For loop with one-line syntax ----
echo -e "\n== For loop with one-line syntax =="
for color in red green blue; do echo "Color: $color"; done

# ---- For loop with file iteration ----
echo -e "\n== For loop with file iteration =="
# Create some test files
touch test1.txt test2.txt test3.txt
for file in *.txt
do
    echo "Processing file: $file"
done
# Clean up
rm -f test*.txt

# ---- For loop with exit status ----
echo -e "\n== For loop exit status =="
for cmd in "true" "false" "true"
do
    eval $cmd
done
echo "Exit status of for loop: $?"