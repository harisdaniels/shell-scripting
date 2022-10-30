# to make script executable
# chmod = change mode
# +x = executeable permission
# chmod +x script.sh (file name)

# to run the file
# ./script.sh

# declaration the dialect that are using (bash)
# which bash

#! /bin/bash

# ECHO COMMAND to print to the console
echo Hello, world!

# VARIABLE (Uppercase by convention) (Numbers, Letters Underscores)
NICK_NAME="Haris"
echo "My name is $NICK_NAME"
echo "My name is ${NICK_NAME}"

# USER INPUT
read -p "Enter your name: " NAME #variable
echo "Hello $NAME"

# CONDITIONAL 
# (IF STATEMENT)
if [ $NAME == "Bob" ]
then
  echo "Your name is Bob"
fi
# (IF-ELSE)
if [ $NAME == "Bob" ]
then
  echo "Your name is Bob"
else
  echo "Your name is not Bob"
fi
# (ELSE IF) (elif)
if [ $NAME == "Bob" ]
then
  echo "Your name is Bob"
elif [ $NAME == "Paul" ]
then
  echo "Your name is Paul"
else
  echo "Your name is not Bob or Paul"
fi

# COMPARISON
########
# val1 -eq val2 Returns true if the value are equal
# val1 -ne val2 Returns true if the value are NOT equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2
# val1 -lt val2 Returns true if val1 is less than val2
# val1 -le val2 Returns true if val1 is less than or equal to val2
########

NUM1=1
NUM2=2
if [ $NUM1 -gt $NUM2 ]
then
  echo "$NUM1 is greater than $NUM2"
else
  echo "$NUM1 is less than $NUM2"
fi

# FILE CONDITION
########
# -d file True if the file is a directory
# -e file True if the file/directory exists (NOTE: this is not particularly portable, thus -f is generally used )
# -f file True if the provided string is a file
# -g file True if the group id is set on a file
# -r file True if the file is readable
# -s file True if the file has non-zero size
# -u      True if user id is set on a file
# -w file True if the file is writeable
# -x file True if the file is executeable
########
FILE="test.txt"
if [ -e "$FILE" ]
then
  echo "$FILE is exists"
else
  echo "$FILE does not exist"
fi
# rm test.txt (to delete a file)

# CASE STATEMENT
read -p "Are you 21 or over? Y/N " ANSWER
case "$ANSWER" in
  [y/Y] | [yY][eE][sS])
    echo "You can have a beer :D"
    ;;
  [n/N] | [nN][oO])
    echo "Sorry, You cannot have a beer :)"
    ;;
  *)
    echo "Please enter y/yes or n/no"
    ;;
esac

# SIMPLE LOOPS
NAMES="Brad Alice Emma Donna"
for NAME in $NAMES
  do
    echo "Hello $NAME"
done

# FOR LOOPS to rename the files
FILES=$(ls *.txt)
NEW="new" 
for FILE in $FILES
  do
    echo "Renaming $FILE to new-$FILE"
    mv $FILE $NEW-$FILE # mv == move
done

#WHILE LOOP - READ THROUGH FILE LINE BY LINE
LINE=1 # index of the iterators
while read -r CURRENT_LINE
  do
    echo "$LINE: $CURRENT_LINE" # CURRENT_LINE is the text of the line
    ((LINE++))
done < "./test.txt"

#FUNCTION
function sayHello() {
  echo "Hello world"
}
sayHello

#FUNCTION WITH PARAMETER
function greet() {
  #Positional Parameters
  echo "Hello, I am $1 and I am $2"
}
greet "Bob" "32"

#BASIC COMMAND
#CREATE FOLDER AND WRITE TO A FILE
mkdir hello
touch "hello/world.txt"
echo "Hello World" >> "hello/world.txt" # Write "Hello World in hello/world.txt using >>"
echo "Created hello/world.txt"