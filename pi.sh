k=1
s=0

for ((i=0;i<1000000;i++)) do
    if ((k%2==0)) then
        s+=4/k
    else 
        s-=4/k
    fi
    k+=2
done

echo s

