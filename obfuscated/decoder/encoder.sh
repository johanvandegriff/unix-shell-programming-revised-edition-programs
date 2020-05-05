#!/bin/bash
cd `dirname $0`
> tmp
echo -n "Phrase: "
read answer
length=`echo "$answer" | wc -c`
length=`expr "$length" - 1`
echo -n "Offset: "
read offset
i=0
while [ "$i" -lt "$length" ]
do
  i=`expr "$i" + 1`
  number=`echo "$answer" | cut "-c$i-$i"`
  number=`printf "%d\n" "'$number"`
  number=`expr "$number" + "$offset"`
  printf \\$(printf '%03o' "$number") >> tmp
done
echo
echo -n "Phrase: "
cat tmp
echo
echo "Offset: $offset"
echo "Length: $length"
rm tmp
