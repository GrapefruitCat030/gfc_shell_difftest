#!/bin/bash
# Bash while loop examples

# ---- Basic while loop with a counter ----
echo "== Basic while loop with counter =="
i=1
while [ $i -le 5 ]
do
    echo "Iteration: $i"
    ((i++))
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

# ---- Processing command output ----
echo -e "\n== Processing command output =="
while read -r file
do
    echo "Found script: $file"
done < <(ls -1 *.sh 2>/dev/null)

# ---- Infinite loop with break condition ----
echo -e "\n== Infinite loop with break condition =="
count=1
while :  # Colon is a shell builtin that always returns true (0)
do
    echo "Count: $count"
    ((count++))
    if [ $count -gt 5 ]; then
        echo "Breaking out of the loop"
        break
    fi
done

# ---- While loop with continue statement ----
echo -e "\n== While loop with continue statement =="
num=0
while [ $num -lt 10 ]
do
    ((num++))
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
    ((a++, b--))
done

# ---- Nested while loops ----
echo -e "\n== Nested while loops =="
outer=1
while [ $outer -le 3 ]
do
    echo "Outer loop: $outer"
    inner=1
    while [ $inner -le 2 ]
    do
        echo "  Inner loop: $inner"
        ((inner++))
    done
    ((outer++))
done

# ---- While loop with case statement ----
echo -e "\n== While loop with case statement =="
selection=""
while [ "$selection" != "q" ]
do
    echo -e "\nSelect option:"
    echo "1. Option 1"
    echo "2. Option 2"
    echo "q. Quit"
    read -p "Enter choice: " selection
    case $selection in
        1) echo "You selected Option 1" ;;
        2) echo "You selected Option 2" ;;
        q) echo "Exiting..." ;;
        *) echo "Invalid selection" ;;
    esac
done

# ---- Until loop (opposite of while) ----
echo -e "\n== Until loop (opposite of while) =="
count=5
until [ $count -le 0 ]
do
    echo "Counting down: $count"
    ((count--))
done