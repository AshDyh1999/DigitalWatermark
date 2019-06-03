%独立性检验的统计函数
function result=freq(rando,rande) 
[rowo,colo]=size(rando);
[rowe,cole]=size(rande);
result=zeros(11,11);
for i=1:colo
    k=1;
    if rando(1,i)<=0.1 & rando(1,i)>0
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
    end  
    k=2;
    if rando(1,i)<=0.2 & rando(1,i)>0.1
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
   k=3;
   if rando(1,i)<=0.3 & rando(1,i)>0.2
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
   k=4;
   if rando(1,i)<=0.4 & rando(1,i)>0.3
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
   k=5;
   if rando(1,i)<=0.5 & rando(1,i)>0.4
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
   k=6;
   if rando(1,i)<=0.6 & rando(1,i)>0.5
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
   k=7;
   if rando(1,i)<=0.7 & rando(1,i)>0.6
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
   k=8;
   if rando(1,i)<=0.8 & rando(1,i)>0.7
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
   k=9;
   if rando(1,i)<=0.9 & rando(1,i)>0.8
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
   k=10;
   if rando(1,i)<1 & rando(1,i)>0.9
        if rande(1,i)>0 & rande(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if rande(1,i)>0.1 & rande(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if rande(1,i)>0.2 & rande(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if rande(1,i)>0.3 & rande(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if rande(1,i)>0.4 & rande(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if rande(1,i)>0.5 & rande(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if rande(1,i)>0.6 & rande(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if rande(1,i)>0.7 & rande(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if rande(1,i)>0.8 & rande(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if rande(1,i)>0.9 & rande(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
end
temp=0;
for i=1:10
    result(i,11)=result(i,1)+result(i,2)+result(i,3)+result(i,4)+result(i,5)+result(i,6)+result(i,7)+result(i,8)+result(i,9)+result(i,10);
    temp=result(i,11)+temp;
end
temp2=0;
for j=1:10
    result(11,j)=result(1,j)+result(2,j)+result(3,j)+result(4,j)+result(5,j)+result(6,j)+result(7,j)+result(8,j)+result(9,j)+result(10,j);
    temp2=result(11,j)+temp2;
end
if temp2==temp
result(11,11)=1;
end