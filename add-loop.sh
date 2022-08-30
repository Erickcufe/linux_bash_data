echo "How many Loops Do You Want?"
read LOOPS

COUNT=1
while [ $COUNT -le $LOOPS ]
do
	echo "Loop #$COUNT"
	((COUNT++))
done
