#!/usr/bin/env fish
# Fish while loop examples

# ---- Basic while loop with counter ----
echo "== Basic while loop with counter =="
set i 1
while test $i -le 5
    echo "Iteration: $i"
    set i (math $i + 1)
end

# ---- Reading file line by line ----
echo -e "\n== Reading file contents line by line =="
# Create temporary file
echo "Line 1
Line 2
Line 3" > temp.txt

while read -l line
    echo "Read: $line"
end < temp.txt
rm temp.txt

# ---- Infinite loop with break condition ----
echo -e "\n== Infinite loop with break condition =="
set count 1
while true
    echo "Count: $count"
    set count (math $count + 1)
    if test $count -gt 5
        echo "Breaking out of the loop"
        break
    end
end

# ---- While loop with continue statement ----
echo -e "\n== While loop with continue statement =="
set num 0
while test $num -lt 10
    set num (math $num + 1)
    # Skip even numbers
    if test (math $num % 2) -eq 0
        echo "Skipping even number: $num"
        continue
    end
    echo "Processing odd number: $num"
end

# ---- While loop with multiple conditions ----
echo -e "\n== While loop with multiple conditions =="
set a 1
set b 10
while test $a -le 3; and test $b -ge 8
    echo "a=$a, b=$b"
    set a (math $a + 1)
    set b (math $b - 1)
end

# ---- Nested while loops ----
echo -e "\n== Nested while loops =="
set outer 1
while test $outer -le 3
    echo "Outer loop: $outer"
    set inner 1
    while test $inner -le 2
        echo "  Inner loop: $inner"
        set inner (math $inner + 1)
    end
    set outer (math $outer + 1)
end

# ---- While loop with command execution ----
echo -e "\n== While loop with command execution =="
set files (ls *.fish 2>/dev/null)
set index 1
while test $index -le (count $files)
    echo "Fish script: $files[$index]"
    set index (math $index + 1)
end

# ---- While loop with stdin processing ----
echo -e "\n== While loop with stdin processing =="
echo "a b c" | while read -l char
    echo "Character: $char"
end

# ---- While loop with begin block ----
echo -e "\n== While loop with begin block =="
set counter 1
while test $counter -le 3
    begin
        set -l local_var "Local value $counter"
        echo $local_var
    end
    # local_var not available here
    set counter (math $counter + 1)
end