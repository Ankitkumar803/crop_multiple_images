#
#Name the directory as test
echo "Enter dimension in pixels : width height top left"
read width height toplen leftlen
array=(val1 val2)
#making output dirctory
mkdir test_out
#
for n in `ls ./test`
do
	#output pictures will be created with .out extension
	convert ./test/$n -crop $width\x$height+$toplen+$leftlen ./test_out/$n.out
done
#
k=0
for n in `ls ./test_out`
do
	arr[$k]=$n
	k=$((k+1))
done
#
echo ${arr[@]}
y=0
touch output.pdf
#
while [ $y -lt ${#arr[*]} ]
do
echo ${arr[$y]}
echo ${arr[$((y+1))]}
convert ./test_out/${arr[$y]} ./test_out/${arr[$((y+1))]} -append output1.pdf
convert output.pdf output1.pdf output.pdf
echo $y
y=$((y+2))

done


#removing the intermidiate files
rm -rf test_out
rm output1.pdf

