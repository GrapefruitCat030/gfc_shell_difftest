#!/bin/sh
# POSIX until loop examples

# ---- Basic until loop with counter ----
echo "== Basic until loop with counter =="
i=5
until [ $i -le 0 ]
do
    echo "Countdown: $i"
    i=$((i - 1))
done
echo "Blast off!"

# ---- Until with complex condition ----
echo -e "\n== Until loop with complex condition =="
num=10
until [ $num -lt 5 ] || [ $num -eq 7 ]
do
    echo "Number is: $num"
    num=$((num - 1))
done

# ---- Reading input until condition is met ----
echo -e "\n== Reading input until condition is met =="
# Create temporary file
cat > temp.txt << EOF
apple
banana
orange
quit
grape
EOF

until read -r line && [ "$line" = "quit" ]
do
    echo "Read: $line"
done < temp.txt
rm temp.txt

# ---- Until loop with command execution ----
echo -e "\n== Until loop with command execution =="
# Create test file that we'll modify
echo "initial" > test_file.txt
until grep -q "done" test_file.txt
do
    echo "File doesn't contain 'done' yet"
    echo "done" >> test_file.txt
done
echo "Found 'done' in file"
rm test_file.txt

# ---- Until loop with break statement ----
echo -e "\n== Until loop with break statement =="
counter=1
until false # This condition is always false, so loop would run indefinitely
do
    echo "Iteration: $counter"
    counter=$((counter + 1))
    if [ $counter -gt 5 ]; then
        echo "Breaking out of the loop"
        break
    fi
done

# ---- Until loop with continue statement ----
echo -e "\n== Until loop with continue statement =="
counter=10
until [ $counter -lt 1 ]
do
    if [ $counter -eq 5 ]; then
        echo "Skipping iteration at counter=5"
        counter=$((counter - 1))
        continue
    fi
    echo "Counter: $counter"
    counter=$((counter - 1))
done

# ---- Nested until loops ----
echo -e "\n== Nested until loops =="
outer=3
until [ $outer -le 0 ]
do
    echo "Outer loop: $outer"
    inner=2
    until [ $inner -le 0 ]
    do
        echo "  Inner loop: $inner"
        inner=$((inner - 1))
    done
    outer=$((outer - 1))
done

# ---- Until loop exit status demonstration ----
echo -e "\n== Until loop exit status demonstration =="
until false
do
    echo "This will execute once"
    exit_code=3
    echo "Setting exit code to $exit_code"
    exit $exit_code
done || echo "Last command in until loop failed with status: $?"