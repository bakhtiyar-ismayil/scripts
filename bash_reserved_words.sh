#!/bin/bash

# 1. '!' - Used for negating a condition
var=5
if [ ! $var -eq 10 ]; then
    echo "var is not equal to 10"
fi

# 2. '{' and '}' - Used for grouping commands in loops or conditionals
for i in {1..3}; do
    echo "Number: $i"
done

# 3. '(' and ')' - Used for grouping in subshells
echo "Start"
(
    echo "Inside subshell"
)
echo "End"

# 4. '[[' and ']]' - Used for more advanced condition checks
if [[ $var -eq 5 && $var -lt 10 ]]; then
    echo "var is between 5 and 10"
fi

# 5. 'do' - Starts the body of a loop
for i in {1..3}; do
    echo "Inside loop: $i"
done

# 6. 'done' - Ends the body of a loop
echo "Loop finished"

# 7. 'elif' - Used in conditional statements
if [ $var -eq 10 ]; then
    echo "var is 10"
elif [ $var -eq 5 ]; then
    echo "var is 5"
else
    echo "var is neither 5 nor 10"
fi

# 8. 'else' - Used in conditional statements as a fallback
if [ $var -eq 10 ]; then
    echo "var is 10"
else
    echo "var is not 10"
fi

# 9. 'fi' - Ends an 'if' block
echo "If statement completed"

# 10. 'for' - Used for looping
for i in {1..3}; do
    echo "Counting: $i"
done

# 11. 'function' - Used to define a function
function say_hello {
    echo "Hello, World!"
}
say_hello

# 12. 'if' - Used to start a conditional statement
if [ -f "somefile.txt" ]; then
    echo "File exists"
else
    echo "File doesn't exist"
fi

# 13. 'in' - Used in loops and conditionals (e.g., in 'for' and 'select')
for color in red blue green; do
    echo "Color: $color"
done

# 14. 'select' - Used for creating simple menus
select fruit in Apple Banana Cherry; do
    echo "You selected $fruit"
    break
done

# 15. 'then' - Used to specify the action for 'if' statements
if [ $var -eq 5 ]; then
    echo "var is 5"
fi

# 16. 'time' - Used to measure the time it takes to run a command
time ls

# 17. 'until' - Executes commands until a condition is true
counter=1
until [ $counter -gt 3 ]; do
    echo "Counter: $counter"
    ((counter++))
done

# 18. 'while' - Used for looping as long as a condition is true
counter=1
while [ $counter -le 3 ]; do
    echo "Counter: $counter"
    ((counter++))
done

# 19. 'case' - Used for multiple condition checks
case $var in
    5)
        echo "var is 5"
        ;;
    10)
        echo "var is 10"
        ;;
    *)
        echo "var is neither 5 nor 10"
        ;;
esac

# 20. 'esac' - Ends a 'case' block
echo "Case statement finished"

# 21. 'break' - Used to exit from a loop
for i in {1..5}; do
    if [ $i -eq 3 ]; then
        break
    fi
    echo "Counting: $i"
done

# 22. 'continue' - Skips the current iteration of a loop
for i in {1..5}; do
    if [ $i -eq 3 ]; then
        continue
    fi
    echo "Counting: $i"
done

# 23. 'return' - Exits from a function and optionally returns a value
function return_example {
    return 42
}
return_example
echo "Returned value: $?"

# 24. 'exec' - Executes a command and replaces the shell with the command
# (Note: This will replace the current shell session with the 'ls' command)
# exec ls

# 25. 'exit' - Exits the script with a specified exit status
# exit 0

# 26. 'set' - Used for shell options or positional parameters
set -x  # Enable debugging
echo "This will be debugged"
set +x  # Disable debugging

# 27. 'unset' - Unsets a variable or function
var_to_unset="Hello"
echo $var_to_unset
unset var_to_unset
echo $var_to_unset  # Should print nothing


