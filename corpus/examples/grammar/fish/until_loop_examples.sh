#!/usr/bin/env fish
# Fish shell equivalents to until loops

# ---- Basic until loop equivalent with counter ----
echo "== Basic until equivalent with counter =="
set i 5
while test $i -gt 0
    echo "Countdown: $i"
    set i (math $i - 1)
end
echo "Blast off!"

# ---- Until equivalent with complex condition ----
echo -e "\n== Until equivalent with complex condition =="
set num 10
while not test $num -lt 5; and not test $num -eq 7
    echo "Number is: $num"
    set num (math $num - 1)
end

# ---- Reading input until condition is met ----
echo -e "\n== Reading input until condition is met =="
# Create temporary file
echo -e "apple\nbanana\norange\nquit\ngrape" > temp.txt

while read -l line; and test "$line" != "quit"
    echo "Read: $line"
end < temp.txt
rm temp.txt

# ---- Until equivalent with command execution ----
echo -e "\n== Until equivalent with command execution =="
# Create test file that we'll modify
echo "initial" > test_file.txt
while not grep -q "done" test_file.txt
    echo "File doesn't contain 'done' yet"
    echo "done" >> test_file.txt
end
echo "Found 'done' in file"
rm test_file.txt

# ---- Until equivalent with break statement ----
echo -e "\n== Until equivalent with break statement =="
set counter 1
while true  # Equivalent to "until false"
    echo "Iteration: $counter"
    set counter (math $counter + 1)
    if test $counter -gt 5
        echo "Breaking out of the loop"
        break
    end
end

# ---- Until equivalent with continue statement ----
echo -e "\n== Until equivalent with continue statement =="
set counter 10
while test $counter -ge 1
    if test $counter -eq 5
        echo "Skipping iteration at counter=5"
        set counter (math $counter - 1)
        continue
    end
    echo "Counter: $counter"
    set counter (math $counter - 1)
end

# ---- Processing arrays with until equivalent ----
echo -e "\n== Processing arrays with until equivalent =="
set fruits apple banana orange grape kiwi
set index 1
while test $index -le (count $fruits)
    echo "Fruit at position $index: $fruits[$index]"
    set index (math $index + 1)
end

# ---- Nested until equivalent loops ----
echo -e "\n== Nested until equivalent loops =="
set outer 3
while test $outer -gt 0
    echo "Outer loop: $outer"
    set inner 2
    while test $inner -gt 0
        echo "  Inner loop: $inner"
        set inner (math $inner - 1)
    end
    set outer (math $outer - 1)
end

# ---- Until equivalent with status check ----
echo -e "\n== Until equivalent with status check =="
function check_condition
    return 1  # Non-zero return = failure (would make until loop continue)
end

set attempts 1
while not check_condition; and test $attempts -le 3
    echo "Attempt $attempts failed"
    set attempts (math $attempts + 1)
end