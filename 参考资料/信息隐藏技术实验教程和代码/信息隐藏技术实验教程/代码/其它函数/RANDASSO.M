%满抛物线混沌序列与线性同余组合的伪随机数发生器
function randmtx=randasso(row,col,seed)
if nargin<3
    seed=0.5;
end    
randmtxtemp1=chaotic1(1,row*col,seed);
randmtxtemp2=chaotic1(1,row*col,seed/2);
randmtxindex=round(randU1(1,row*col,seed,1,row*col));
for i=1:row*col
    randmtx(1,i)=randmtxtemp1(1,randmtxindex(1,i));
    randmtxtemp1(1,randmtxindex(1,i))=randmtxtemp2(1,randmtxindex(1,i));
end
randmtx=reshape(randmtx,row,col);
        
