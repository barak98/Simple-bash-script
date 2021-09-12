OPTION=$1
PASS="."
if [ $OPTION == "-f" ]
then  
  if ! [ -f $2 ]
    then
     echo "File dosent exist" && exit 1;
    fi
  PASS=`cat $2` 
else
  PASS="$1" 
fi

ISPASSOK=0 #i set at the start that the pass is ok
           #but if the script finds an error it will change it to false
           #and print all the things that are not ok
RED='\033[0;31m'
GREEN='\033[0;32m'

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

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
if [ $ISPASSOK == 1 ]
then
    echo -e "${RED} Password is not strong ${NC}" && exit 1
else
    echo -e "${GREEN}Password is strong${NC}" && exit 0 
fi