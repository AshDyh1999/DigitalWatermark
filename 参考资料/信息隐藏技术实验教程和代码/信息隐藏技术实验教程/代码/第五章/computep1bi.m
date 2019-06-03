%计算P1(Bi)的子函数
%headr为块首行地址
%headc为块首列地址
function p1bi=computep1bi(headr,headc,image)
p1bi=0;
for i=1:10
    for j=1:10
        if  image(headr+i-1,headc+j-1)==1
            p1bi=p1bi+1;
        end
    end
end
