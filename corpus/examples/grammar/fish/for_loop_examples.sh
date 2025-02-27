#!/usr/bin/env fish
# Fish for loop examples

# ---- Basic for loop with explicit items ----
echo "== Basic for loop with explicit items =="
for fruit in apple banana orange
    echo "Current fruit: $fruit"
end

# ---- For loop with variable expansion ----
echo -e "\n== For loop with variable expansion =="
set planets Mercury Venus Earth Mars
for planet in $planets
    echo "Current planet: $planet"
end

# ---- For loop with brace expansion ----
echo -e "\n== For loop with brace expansion =="
for animal in {cat,}fish dog bird
    echo "Animal: $animal"
end

# ---- For loop with command substitution ----
echo -e "\n== For loop with command substitution =="
for file in (ls *.fish 2>/dev/null)
    echo "Fish script file: $file"
end

# ---- For loop with numeric range using seq ----
echo -e "\n== For loop with numeric range using seq =="
for i in (seq 1 5)
    echo "Number: $i"
end

# ---- For loop with numeric range (start, step, end) ----
echo -e "\n== For loop with numeric range and step =="
for i in (seq 0 2 10)
    echo "Even number: $i"
end

# ---- For loop with break ----
echo -e "\n== For loop with break =="
for i in (seq 1 10)
    echo "Iteration: $i"
    if test $i -eq 5
        echo "Breaking at 5"
        break
    end
end

# ---- For loop with continue ----
echo -e "\n== For loop with continue =="
for i in (seq 1 5)
    if test $i -eq 3
        echo "Skipping 3"
        continue
    end
    echo "Number: $i"
end

# ---- For loop with redirection ----
echo -e "\n== For loop with redirection =="
# Create a temporary file
echo -e "line1\nline2\nline3" > temp.txt
for line in (cat temp.txt)
    echo "Line content: $line"
end
# Clean up
rm -f temp.txt

# ---- Using begin block with for loop ----
echo -e "\n== Using begin block with for loop =="
for color in red green blue
    begin
        set -l brightness "bright"
        echo "$brightness $color"
    end
    # brightness is not available here
end