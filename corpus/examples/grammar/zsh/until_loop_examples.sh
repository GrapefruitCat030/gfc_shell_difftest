#!/usr/bin/env zsh
# Zsh until loop examples

# ---- Basic until loop with counter ----
echo "== Basic until loop with counter =="
i=5
until (( i <= 0 ))
do
    echo "Countdown: $i"
    (( i-- ))
done
echo "Blast off!"

# ---- Until with complex condition ----
echo -e "\n== Until loop with complex condition =="
num=10
until (( num < 5 || num == 7 ))
do
    echo "Number is: $num"
    (( num-- ))
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

until read -r line && [[ "$line" = "quit" ]]
do
    echo "Read: $line"
done < temp.txt
rm temp.txt

# ---- Until loop with arrays (Zsh-specific) ----
echo -e "\n== Until loop with arrays =="
fruits=(apple banana orange grape kiwi)
index=1  # Zsh arrays are 1-indexed by default
until (( index > $#fruits ))
do
    echo "Fruit at position $index: $fruits[$index]"
    (( index++ ))
done

# ---- Until loop with break statement ----
echo -e "\n== Until loop with break statement =="
counter=1
until false # This condition is always false, so loop would run indefinitely
do
    echo "Iteration: $counter"
    (( counter++ ))
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
        (( counter-- ))
        continue
    fi
    echo "Counter: $counter"
    (( counter-- ))
done

# ---- Until loop with glob qualifier (Zsh-specific) ----
echo -e "\n== Until loop with glob qualifier =="
# Create some test files
touch file1.txt file2.txt file3.log
files=(*.txt(N))  # (N) prevents error if no match
index=1
until (( index > $#files ))
do
    echo "Text file: $files[$index]"
    (( index++ ))
done
# Clean up
rm -f file*.txt file*.log

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
        (( inner-- ))
    done
    (( outer-- ))
done

# ---- Zsh-specific features with until loop ----
echo -e "\n== Zsh-specific features with until loop =="
letters=(a b c d e)
index=1
# Alternative condition syntax in Zsh
until [[ $index -gt $#letters ]]
do
    print -P "%F{green}Letter $index: $letters[$index]%f"
    (( index++ ))
done