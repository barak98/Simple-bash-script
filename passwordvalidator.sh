PASS=$@ 

#checks lenght of password
if [ ${#PASS} -lt 10 ] ;
then
    echo "Password Must be at least 10 characters long" && exit 1
fi

#checks if ther is no an uppercase
if ! [[  "$PASS" =~ [[:upper:]] ]]; then
  echo "uppercase character not found" && exit 1
fi

#checks if ther is not a lowercase  
if ! [[  "$PASS" =~ [[:lower:]] ]]; then
  echo "lowercase character not found" && exit 1
fi

# chexkes if there is no digit
if ! [[  "$PASS" =~ [[:digit:]] ]]; then
  echo "digit character not found" && exit 1
fi

echo "pass is ok"