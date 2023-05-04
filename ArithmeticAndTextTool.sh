#!/bin/bash

# function to compute arithmetic mean
function means() {
    # Prompt the user to input 5 integers
echo "Enter 5 integers:"
read a b c d e

# Compute Arithmetic mean
arithmetic_mean=$(( ($a + $b + $c + $d + $e) / 5 ))

# Compute Geometric mean
geometric_mean=$(echo "scale=2; sqrt($a*$b*$c*$d*$e)" | bc)

# Compute Harmonic mean
harmonic_mean=$(echo "scale=2; 5/((1/$a)+(1/$b)+(1/$c)+(1/$d)+(1/$e))" | bc)

# Compute Root mean square
root_mean_square=$(echo "scale=2; sqrt((($a*$a)+($b*$b)+($c*$c)+($d*$d)+($e*$e))/5)" | bc)

# Compute Contraharmonic mean
contraharmonic_mean=$(echo "scale=2; ((($a*$a)+($b*$b)+($c*$c)+($d*$d)+($e*$e)+4*$a*$b+4*$a*$c+4*$a*$d+4*$a*$e+4*$b*$c+4*$b*$d+4*$b*$e+4*$c*$d+4*$c*$e+4*$d*$e)/20)/((1/$a)+(1/$b)+(1/$c)+(1/$d)+(1/$e)+4/(1/$a+1/$b)+4/(1/$a+1/$c)+4/(1/$a+1/$d)+4/(1/$a+1/$e)+4/(1/$b+1/$c)+4/(1/$b+1/$d)+4/(1/$b+1/$e)+4/(1/$c+1/$d)+4/(1/$c+1/$e)+4/(1/$d+1/$e))" | bc)

# Output the results
echo "Arithmetic mean: $arithmetic_mean"
echo "Geometric mean: $geometric_mean"
echo "Harmonic mean: $harmonic_mean"
echo "Root mean square: $root_mean_square"
echo "Contraharmonic mean: $contraharmonic_mean"
}

# function to compute greatest common divisor
function gcd() {
    # Take input on two variables
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Calculate the GCD using Euclid's algorithm
a=$num1
b=$num2
while [ $b -ne 0 ]
do
  temp=$b
  b=$(($a % $b))
  a=$temp
done
gcd=$a

# Output the GCD
echo "The GCD of $num1 and $num2 is: $gcd"
}

# function to compute least common multiple
function lcm() {
    # Take input on two variables
echo "Enter first number: "
read a
echo "Enter second number: "
read b

# Calculate the greatest common divisor
x=$a
y=$b

while [ $x -ne $y ]
do
  if [ $x -gt $y ]
  then
    x=$((x-y))
  else
    y=$((y-x))
  fi
done

gcd=$x

# Calculate the least common multiple
lcm=$((a*b/gcd))

# Print the result
echo "The least common multiple of $a and $b is: $lcm"
}

# function to replace string in text
function replace_string() {
    # read input variables
read -p "The word you want to insert: " var1
read -p "The word you want to replace: " var2
read -p "The text in which you want to replace the word: " text

# replace occurrences of var2 with var1 in the text
new_text="${text//$var2/$var1}"

# print the new text
echo "$new_text"
}

# function to calculate days since beginning of the year
function days_since_start() {
   # Get input
echo "Enter day of month (1-31): "
read day
echo "Enter month (1-12): "
read month
echo "Enter year: "
read year

# Calculate days passed
days_in_month=(31 28 31 30 31 30 31 31 30 31 30 31)
if [[ $((year%4)) -eq 0 && ($((year%100)) -ne 0 || $((year%400)) -eq 0) ]]; then
  days_in_month[1]=29
fi

days_passed=0
for (( i=1; i<$month; i++ ))
do
  days_passed=$((days_passed + ${days_in_month[$i-1]}))
done
days_passed=$((days_passed + ${day}))

days_remaining=0
if [[ $month = 12 ]]; then
    days_remaining=$((31 - ${day}))
else
    for ((i=$month-1; i<12; i++))
    do
      if [ "${days_in_month[$i]}" ]; then
        days_remaining=$((days_remaining + ${days_in_month[$i]}))
      fi
    done
    days_remaining=$((days_remaining - ${day}))
fi

echo "Days passed since the beginning of the year: $days_passed"
echo "Days remaining until the end of the year: $days_remaining"
}

while true
do
    echo "  "
    echo "===="
    echo "Menu"
    echo "===="
    echo "Choose an option:"
    echo "1. Compute arithmetic mean, geometric mean, harmonic mean, root mean square, and contraharmonic mean"
    echo "2. Compute greatest common divisor"
    echo "3. Compute least common multiple"
    echo "4. Replace string in text"
    echo "5. How Many Days Since The Beginning Of The Year And Until The End Of The Year"
    echo "6. Exit"

    read choice

    case $choice in
        1) means ;;
        2) gcd ;;
        3) lcm ;;
        4) replace_string ;;
        5) days_since_start ;;
        6) exit ;;
        *) echo "Invalid option";;
    esac
done