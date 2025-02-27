#!/bin/bash
# Bash until loop examples

# ---- Basic until loop with counter ----
echo "== Basic until loop with counter =="
i=5
until (( i <= 0 ))
do
    echo "Countdown: $i"
    ((i--))
done
echo "Blast off!"

# ---- Until with complex condition ----
echo -e "\n== Until loop with complex condition =="
num=10
until (( num < 5 || num == 7 ))
do
    echo "Number is: $num"
    ((num--))
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

# ---- Until loop with process substitution (Bash-specific) ----
echo -e "\n== Until loop with process substitution =="
counter=1
until read -r line && [[ "$line" == "end" ]]
do
    echo "Line $counter: $line"
    ((counter++))
done < <(echo -e "first\nsecond\nend\nfourth")

# ---- Until loop with break statement ----
echo -e "\n== Until loop with break statement =="
counter=1
until false # This condition is always false, so loop would run indefinitely
do
    echo "Iteration: $counter"
    ((counter++))
    if (( counter > 5 )); then
        echo "Breaking out of the loop"
        break
    fi
done

# ---- Until loop with continue statement ----
echo -e "\n== Until loop with continue statement =="
counter=10
until (( counter < 1 ))
do
    if (( counter == 5 )); then
        echo "Skipping iteration at counter=5"
        ((counter--))
        continue
    fi
    echo "Counter: $counter"
    ((counter--))
done

# ---- Until loop with array processing ----
echo -e "\n== Until loop with array processing =="
fruits=("apple" "banana" "orange" "grape" "kiwi")
index=0
until (( index >= ${#fruits[@]} ))
do
    echo "Fruit at position $index: ${fruits[index]}"
    ((index++))
done

# ---- Nested until loops ----
echo -e "\n== Nested until loops =="
outer=3
until (( outer <= 0 ))
do
    echo "Outer loop: $outer"
    inner=2
    until (( inner <= 0 ))
    do
        echo "  Inner loop: $inner"
        ((inner--))
    done
    ((outer--))
done

# ---- Until loop with command execution ----
echo -e "\n== Until loop with command execution =="
timestamp=$(date +%s)
until (( $(date +%s) >= timestamp + 3 ))
do
    echo "Waiting... (Ctrl+C to stop)"
    sleep 1
done
echo "3 seconds have passed"