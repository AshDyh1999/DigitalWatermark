%画统计直方图的函数
function result=plothist(randm)
[row,col]=size(randm);
result=zeros(1,10);
k=1;
for i=1:col
       if randm(1,i)>0 & randm(1,i)<=0.1
            result(k,1)=result(k,1)+1;
        end
        if randm(1,i)>0.1 & randm(1,i)<=0.2
            result(k,2)=result(k,2)+1;
        end
        if randm(1,i)>0.2 & randm(1,i)<=0.3
            result(k,3)=result(k,3)+1;
        end
        if randm(1,i)>0.3 & randm(1,i)<=0.4
            result(k,4)=result(k,4)+1;
        end
        if randm(1,i)>0.4 & randm(1,i)<=0.5
            result(k,5)=result(k,5)+1;
        end
       if randm(1,i)>0.5 & randm(1,i)<=0.6
            result(k,6)=result(k,6)+1;
        end
        if randm(1,i)>0.6 & randm(1,i)<=0.7
            result(k,7)=result(k,7)+1;
        end
       if randm(1,i)>0.7 & randm(1,i)<=0.8
            result(k,8)=result(k,8)+1;
        end
       if randm(1,i)>0.8 & randm(1,i)<=0.9
            result(k,9)=result(k,9)+1;
        end
       if randm(1,i)>0.9 & randm(1,i)<1
           result(k,10)=result(k,10)+1;
       end
   end
 result=result/(col*0.1);
 x=0:0.1:1;
 %hist(x,result);title('频率直方图');xlabel('组矩');ylabel('f');
 plot(result);title('频率直方图');xlabel('组矩');ylabel('f')