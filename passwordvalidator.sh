OPTION=$1
PASS="."
if [ $OPTION == "-f" ]
then  
  PASS=`cat $2` && echo "file"
else
  PASS="$1" && echo "text"
fi



ISPASSOK=0 #i set at the start that the pass is ok
           #but if the script finds an error it will change it to false
           #and print all the things that are not ok

#checks lenght of password
if [ ${#PASS} -lt 10 ] ;
then
    echo "Password Must be at least 10 characters long" && ISPASSOK=1
fi

#checks if ther is no an uppercase
if ! [[  "$PASS" =~ [[:upper:]] ]]; then
  echo "uppercase character not found" && ISPASSOK=1
fi

#checks if ther is not a lowercase  
if ! [[  "$PASS" =~ [[:lower:]] ]]; then
  echo "lowercase character not found" && ISPASSOK=1
fi

# chexkes if there is no digit
if ! [[  "$PASS" =~ [[:digit:]] ]]; then
  echo "digit character not found" && ISPASSOK=1
fi

if [ $ISPASSOK == 1 ]
then
    exit 1
else
    exit 0 
fi