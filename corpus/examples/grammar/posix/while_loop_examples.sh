#!/bin/sh
# POSIX while loop examples

# ---- Basic while loop with a counter ----
echo "== Basic while loop with counter =="
i=1
while [ $i -le 5 ]
do
    echo "Iteration: $i"
    i=$((i + 1))
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
ls -1 *.sh > files.txt 2>/dev/null
while read -r file
do
    echo "Found script: $file"
done < files.txt
rm files.txt

# ---- Infinite loop with break condition ----
echo -e "\n== Infinite loop with break condition =="
count=1
while :  # Colon is a shell builtin that always returns true (0)
do
    echo "Count: $count"
    count=$((count + 1))
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
    num=$((num + 1))
    # Skip even numbers
    if [ $((num % 2)) -eq 0 ]; then
        echo "Skipping even number: $num"
        continue
    fi
    echo "Processing odd number: $num"
done

# ---- While loop with multiple conditions ----
echo -e "\n== While loop with multiple conditions =="
a=1
b=10
while [ $a -le 3 ] && [ $b -ge 8 ]
do
    echo "a=$a, b=$b"
    a=$((a + 1))
    b=$((b - 1))
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
        inner=$((inner + 1))
    done
    outer=$((outer + 1))
done

# ---- While loop with exit status demonstration ----
echo -e "\n== While loop with exit status demonstration =="
while false
do
    echo "This will not execute"
done
echo "Exit status of while loop with no iterations: $?"

i=1
while [ $i -le 3 ]
do
    if [ $i -eq 3 ]; then
        exit_code=2
        echo "Setting exit code to $exit_code"
        exit $exit_code
    fi
    echo "Iteration: $i"
    i=$((i + 1))
done || echo "Last command in while loop failed with status: $?"