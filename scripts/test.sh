#!/bin/dash -e
if [ "$#" = 0 ]
then
   echo 'test.sh <items>'
   exit 1
fi

for pa in b c d e f g h k n p r s u w x z G O S
do
   printf '   -%s   ' "$pa"
   for qu
   do
      if [ -"$pa" "$qu" ]
      then
         printf T
      else
         printf F
      fi
      printf '   '
   done
   echo
   printf '! -%s   ' "$pa"
   for qu
   do
      if [ ! -"$pa" "$qu" ] 2>/dev/null
      then
         printf T
      else
         printf F
      fi
      printf '   '
   done
   echo
done
