#!/usr/bin/env zsh
# Zsh while loop examples

# ---- Basic while loop with a counter ----
echo "== Basic while loop with counter =="
i=1
while (( i <= 5 ))
do
    echo "Iteration: $i"
    (( i++ ))
done

# ---- Reading file line by line ----
echo -e "\n== Reading file contents line by line =="
# Create temporary file
cat > temp.txt << EOF
Line 1
Line 2
Line 3
EOF

while read -r line
do
    echo "Read: $line"
done < temp.txt
rm temp.txt

# ---- Processing command output with Zsh-specific syntax ----
echo -e "\n== Processing command output =="
for file (*.zsh(N)) {
    echo "Found script: $file"
}

# ---- Infinite loop with break condition ----
echo -e "\n== Infinite loop with break condition =="
count=1
while true
do
    echo "Count: $count"
    (( count++ ))
    if (( count > 5 )); then
        echo "Breaking out of the loop"
        break
    fi
done

# ---- While loop with continue statement ----
echo -e "\n== While loop with continue statement =="
num=0
while (( num < 10 ))
do
    (( num++ ))
    # Skip even numbers
    if (( num % 2 == 0 )); then
        echo "Skipping even number: $num"
        continue
    fi
    echo "Processing odd number: $num"
done

# ---- While loop with multiple conditions ----
echo -e "\n== While loop with multiple conditions =="
a=1
b=10
while (( a <= 3 && b >= 8 ))
do
    echo "a=$a, b=$b"
    (( a++, b-- ))
done

# ---- Nested while loops ----
echo -e "\n== Nested while loops =="
outer=1
while (( outer <= 3 ))
do
    echo "Outer loop: $outer"
    inner=1
    while (( inner <= 2 ))
    do
        echo "  Inner loop: $inner"
        (( inner++ ))
    done
    (( outer++ ))
done

# ---- While loop with arrays ----
echo -e "\n== While loop with arrays =="
fruits=(apple banana orange grape)
i=1
while (( i <= $#fruits ))
do
    echo "Fruit $i: $fruits[i]"
    (( i++ ))
done

# ---- While loop with associative array ----
echo -e "\n== While loop with associative array =="
typeset -A person
person=(name "John" age 30 city "New York")
keys=(${(k)person})
i=1
while (( i <= $#keys ))
do
    key=$keys[i]
    echo "$key: $person[$key]"
    (( i++ ))
done

# ---- While loop with process substitution ----
echo -e "\n== While loop with process substitution =="
while read -r line
do
    echo "Got: $line"
done < <(echo -e "one\ntwo\nthree")